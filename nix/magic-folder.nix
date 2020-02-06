{ lib, python, buildPythonPackage, tahoe-lafs, importlib-metadata, hypothesis, testtools, fixtures }:
buildPythonPackage rec {
  pname = "magic-folder";
  version = "2020-02-05";
  src = lib.cleanSource ../.;

  propagatedBuildInputs = [
    importlib-metadata
    tahoe-lafs
  ];

  checkInputs = [
    hypothesis
    testtools
    fixtures
  ];


  checkPhase = ''
    ${python}/bin/python -m twisted.trial -j $NIX_BUILD_CORES magic_folder

    # TODO Run the integration test suite.  But pytest_twisted is unpackaged
    # afaict.
  '';
}