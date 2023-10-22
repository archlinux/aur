# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zlib-ng-compat
pkgver=2.1.4
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
sha256sums=('a0293475e6a44a3f6c045229fe50f69dc0eebc62a42405a51f19d46a5541e77a')


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
