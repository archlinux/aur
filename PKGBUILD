# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jsoncpp-git
pkgver=1.9.6.r14.gca98c98
pkgrel=1
pkgdesc="C++ library for interacting with JSON"
arch=('i686' 'x86_64')
url="https://github.com/open-source-parsers/jsoncpp"
license=('MIT' 'LicenseRef-jsoncpp')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("jsoncpp=$pkgver" 'libjsoncpp.so')
conflicts=('jsoncpp')
options=('staticlibs')
source=("git+https://github.com/open-source-parsers/jsoncpp.git")
sha256sums=('SKIP')


pkgver() {
  cd "jsoncpp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jsoncpp"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "jsoncpp"

  #cmake --build "_build" --target test
}

package() {
  cd "jsoncpp"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/jsoncpp"
}
