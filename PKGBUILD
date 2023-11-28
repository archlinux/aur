# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zlib-ng-compat
pkgver=2.1.5
pkgrel=2
pkgdesc="zlib replacement with optimizations for 'next generation' systems (replaces zlib)"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/zlib-ng/zlib-ng"
license=('custom:zlib')
depends=('glibc')
makedepends=('cmake')
provides=('zlib' 'libz.so')
conflicts=('zlib')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/zlib-ng/zlib-ng/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3f6576971397b379d4205ae5451ff5a68edf6c103b2f03c4188ed7075fbb5f04')


build() {
  cd "zlib-ng-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DWITH_GTEST=OFF \
    -DZLIB_COMPAT=ON \
    ./
  make -C "_build"
}

check() {
  cd "zlib-ng-$pkgver"

  make -C "_build" test
}

package() {
  cd "zlib-ng-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/zlib-ng-compat"
}
