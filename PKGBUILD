# Maintainer: Sebastian Stammler <stammler@cbs.tu-darmstadt.de>
_gitname=tng
pkgname="${_gitname}-git"
pkgver=1.7.6.r14.g81ca615
pkgrel=1
pkgdesc="Gromacs tng"
arch=('x86_64')
url="http://www.gromacs.org/Downloads"
license=('BSD3')
depends=()
source=("git+https://github.com/gromacs/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  #cd "${_gitname}"
  mkdir -p build
  cd build
  cmake "../${_gitname}" \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_INSTALL_LIBDIR=lib

  make -j $(nproc)
}

check() {
  cd build
  bin/tests/tng_testing
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "../${_gitname}/COPYING"
}
