# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# Installs the wheel the ghidra package ships, so that PyGhidra always matches the Ghidra it runs:
# a new Ghidra release with another PyGhidra fails to build here until pkgver and the depends on
# ghidra follow it.
pkgname=python-pyghidra
_name=${pkgname#python-}
pkgver=3.2.0
pkgrel=1
pkgdesc="Native CPython for Ghidra, from the ghidra package"
arch=(any)
url="https://github.com/NationalSecurityAgency/ghidra/tree/master/Ghidra/Features/PyGhidra"
license=(Apache-2.0)
depends=(python
  'ghidra>=12.2'
  'ghidra<12.3'
  python-jpype1
  python-packaging
  python-typing_extensions)
makedepends=(
  'ghidra>=12.2'
  'ghidra<12.3'
  python-installer)
optdepends=('python-ghidra-stubs: for type checking and completion of the Ghidra API')

package() {
  python -m installer --destdir="$pkgdir" \
    "/opt/ghidra/Ghidra/Features/PyGhidra/pypkg/dist/$_name-$pkgver-py3-none-any.whl"
  # The ghidra package has its own /usr/bin/pyghidra, Ghidra's launcher (support/pyghidraRun); the
  # wheel's entry points stay available as python -m pyghidra
  rm -r "${pkgdir:?}/usr/bin"
}
