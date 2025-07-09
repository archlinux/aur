# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=blosc2-git
pkgver=2.19.0.r4.gffd84083
pkgrel=2
pkgdesc="Next generation c-blosc"
arch=('i686' 'x86_64')
url="https://www.blosc.org/"
license=('BSD-3-Clause')
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
  cmake --build "_build"
}

package() {
  cd "c-blosc2"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/blosc2"
}
