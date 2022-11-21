# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Rich Li <rich@dranek.com>
# Contributor: Sebastien Binet <binet@lblbox>

_pkg=h5py
pkgname=python38-${_pkg}
pkgver=3.7.0
pkgrel=1
pkgdesc="General-purpose Python bindings for the HDF5 library"
arch=(x86_64)
url="https://www.h5py.org/"
license=(BSD)
depends=(hdf5 liblzf python38-numpy)
makedepends=(cython python38-pkgconfig python38-setuptools)
checkdepends=(python38-pytest python38-pytest-mpi python38-pytables)
conflicts=(hdf5-openmpi)
source=(https://files.pythonhosted.org/packages/source/h/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('3fcf37884383c5da64846ab510190720027dca0768def34dd8dcb659dbe5cbf3')
validpgpkeys=(AC47F71DB275ECD0B3DA46E857FA4540DD4EFCF7  # Thomas A Caswell (Brookhaven National Lab) <tcaswell@bnl.gov>
              96B7334D7610EE3E68AFFE589E027116943D6A8B) # Thomas A Caswell <tcaswell@bnl.gov> (new key)
# See https://github.com/h5py/h5py/issues/1299 about lack of GPG sigs for recent releases

prepare() {
  cd ${_pkg}-${pkgver}
  # Allow our numpy version
  sed -i 's/numpy ==/numpy >=/g' setup.py
  # Remove RPATH
  sed -i "s/settings\\['runtime_library_dirs'\\] = settings\\['library_dirs'\\]/pass/" setup_build.py
}

build() {
  cd ${_pkg}-${pkgver}
  H5PY_SYSTEM_LZF=1 python3.8 setup.py build
}

check() {
  local python_version=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export H5PY_TEST_CHECK_FILTERS=1
  PYTHONPATH="${PWD}/${_pkg}-${pkgver}/build/lib.linux-${CARCH}-${python_version}" python3.8 -m pytest --pyargs h5py -rxXs --color=yes
}

package() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 licenses/license.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
