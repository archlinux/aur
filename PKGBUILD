# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=blosc2-git
pkgver=2.9.2.r27.g80464026
pkgrel=1
pkgdesc="Next generation c-blosc"
arch=('i686' 'x86_64')
url="https://www.blosc.org/"
license=('BSD')
depends=('glibc' 'lz4' 'zlib' 'zstd')
makedepends=('git' 'cmake')
provides=("blosc2=$pkgver")
conflicts=('blosc2')
options=('staticlibs')
source=("git+https://github.com/Blosc/c-blosc2.git")
sha256sums=('SKIP')


pkgver() {
  cd "c-blosc2"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "c-blosc2"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DPREFER_EXTERNAL_LZ4=ON \
    -DPREFER_EXTERNAL_ZLIB=ON \
    -DPREFER_EXTERNAL_ZSTD=ON \
    ./
  make -C "_build"
}

package() {
  cd "c-blosc2"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/blosc2"
}
