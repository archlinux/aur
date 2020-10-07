# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=blosc-git
pkgver=1.20.1.r1.g5352508
pkgrel=1
pkgdesc="A blocking, shuffling and loss-less compression library"
arch=('i686' 'x86_64')
url="https://blosc.org/"
license=('BSD')
depends=('glibc' 'lz4' 'snappy' 'zlib' 'zstd')
makedepends=('git' 'cmake')
provides=('blosc')
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
    -DPREFER_EXTERNAL_LZ4="ON" \
    -DPREFER_EXTERNAL_SNAPPY="ON" \
    -DPREFER_EXTERNAL_ZLIB="ON" \
    -DPREFER_EXTERNAL_ZSTD="ON" \
    ./
  make -C "_build"
}

check() {
  cd "c-blosc"

  #make tests
}

package() {
  cd "c-blosc"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSES/BLOSC.txt" -t "$pkgdir/usr/share/licenses/blosc"
}
