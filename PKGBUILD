# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zlib-ng-compat
pkgver=2.1.7
pkgrel=1
pkgdesc="zlib replacement with optimizations for 'next generation' systems (replaces zlib)"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/zlib-ng/zlib-ng"
license=('Zlib')
depends=('glibc')
makedepends=('cmake')
provides=('zlib' 'libz.so')
conflicts=('zlib')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/zlib-ng/zlib-ng/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('59e68f67cbb16999842daeb517cdd86fc25b177b4affd335cd72b76ddc2a46d8')


build() {
  cd "zlib-ng-$pkgver"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
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

  #make -C "_build" test
}

package() {
  cd "zlib-ng-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/zlib-ng-compat"
}
