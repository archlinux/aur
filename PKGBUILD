# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=blosc-git
pkgver=1.21.6.r18.g968d3b0
pkgrel=1
pkgdesc="A blocking, shuffling and loss-less compression library"
arch=('i686' 'x86_64')
url="https://blosc.org/"
license=('BSD-3-Clause')
depends=('glibc' 'lz4' 'zlib' 'zstd')
makedepends=('git' 'cmake')
provides=("blosc=$pkgver")
conflicts=('blosc')
options=('staticlibs')
source=("git+https://github.com/Blosc/c-blosc.git")
sha256sums=('SKIP')


pkgver() {
  cd "c-blosc"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "c-blosc"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DPREFER_EXTERNAL_LZ4=ON \
    -DPREFER_EXTERNAL_ZLIB=ON \
    -DPREFER_EXTERNAL_ZSTD=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "c-blosc"

  #cmake --build "_build" --target tests
}

package() {
  cd "c-blosc"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/blosc"
}
