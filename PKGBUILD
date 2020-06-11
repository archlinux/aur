# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Rich Li <rich@dranek.com>
# Contributor: Sebastien Binet <binet@lblbox>

_pkg=h5py
pkgname=python-${_pkg}-git
pkgver=r1197.ff214cdd
pkgrel=1
pkgdesc="General-purpose Python bindings for the HDF5 library"
arch=(x86_64)
url="https://www.h5py.org/"
license=(BSD)
depends=(hdf5 python-numpy python-six)
makedepends=(cython python-pkgconfig)
checkdepends=(python-pytest)
conflicts=(python-h5py hdf5-openmpi)
provides=(python-h5py)
source=("git+https://github.com/h5py/h5py")
md5sums=('SKIP')

pkgver() {
  cd "${_pkg}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Remove RPATH
  sed -i "s/settings\\['runtime_library_dirs'\\] = settings\\['library_dirs'\\]/pass/" ${_pkg}/setup_build.py
}

build() {
  cd ${_pkg}
  python setup.py build
}

check() {
  cd ${_pkg}
  python setup.py test || warning "Tests failed"
}

package() {
  cd ${_pkg}
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1

  install -Dm644 licenses/license.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
