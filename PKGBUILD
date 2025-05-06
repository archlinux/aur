# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Rich Li <rich@dranek.com>
# Contributor: Sebastien Binet <binet@lblbox>

_name=h5py
pkgname=python-${_name}-git
pkgver=3.13.0.r23.g92ec254
pkgrel=1
pkgdesc="General-purpose Python bindings for the HDF5 library"
arch=(x86_64)
url="https://www.h5py.org/"
license=(BSD)
depends=(hdf5 python-numpy liblzf)
makedepends=(cython python-pkgconfig python-setuptools)
checkdepends=(python-pytest)
conflicts=(python-h5py hdf5-openmpi)
provides=(python-h5py)
source=("git+https://github.com/h5py/h5py")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Remove RPATH
  sed -i "s/settings\\['runtime_library_dirs'\\] = settings\\['library_dirs'\\]/pass/" ${_name}/setup_build.py
}

build() {
  cd ${_name}
  H5PY_SYSTEM_LZF=1 python setup.py build
}

check() {
  cd ${_name}
  python setup.py test || warning "Tests failed"
}

package() {
  cd ${_name}
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 licenses/license.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
