# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=caterva-git
pkgver=0.4.0.r142.g6681f3e
pkgrel=1
pkgdesc="open source C library specially designed to deal with large multidimensional, chunked, compressed datasets"
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://caterva.readthedocs.io/en/latest"
license=('BSD')
depends=('lz4' 'zlib' 'zstd')
makedepends=('git' 'cmake' 'ninja')
provides=('caterva')
conflicts=('caterva')
options=('staticlibs')
source=("git+https://github.com/Blosc/caterva.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname//-git/}

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname//-git/}
  git submodule init
  git submodule update
}

build() {
  cd ${pkgname//-git/}

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DPREFER_EXTERNAL_LZ4="ON" \
    -DPREFER_EXTERNAL_ZLIB="ON" \
    -DPREFER_EXTERNAL_ZSTD="ON" \
    -GNinja \
    ./
  ninja -C "_build"
}

package() {
  cd ${pkgname//-git/}

  DESTDIR="$pkgdir" ninja -C "_build" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/caterva"
}
