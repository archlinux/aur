# Maintainer: Jose Angel Soler Ortiz <jose.angel.soler.ortiz at gmail dot com>
# Contributor: Balazs Nemeth <b2nemeth at gmail dot com>

pkgname=trng4-git
pkgver=4.24.r3.g589bdf2
pkgrel=1
pkgdesc='A modern C++ pseudo random number generator library'
arch=('any')
url='https://github.com/rabauke/trng4'
license=('BSD')
makedepends=('git' 'cmake>=3.10.0')
checkdepends=('boost-libs')
conflicts=('trng4')
provides=('trng4')
source=('git+https://github.com/rabauke/trng4')
sha512sums=('SKIP')

pkgver() {
  cd trng4
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../trng4                \
    -DCMAKE_BUILD_TYPE=None     \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build . --target trng4_shared trng4_static test_all
}

check() {
  cd build
  ctest
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  install -Dm644 trng4/COPYING ${pkgdir}/usr/share/licenses/trng4/COPYING
}
