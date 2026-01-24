# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=diamond
pkgver=2.1.21
pkgrel=1
pkgdesc="High performance sequence aligner for protein and translated DNA searches with big sequence data. https://doi.org/10.1038/s41592-021-01101-x"
arch=('x86_64')
url="https://github.com/bbuchfink/diamond"
license=('GPL-3.0-only')
depends=('gcc-libs' 'zlib' 'zstd' 'glibc' 'sqlite')
makedepends=('cmake' 'mold')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbuchfink/diamond/archive/v$pkgver.tar.gz"
        )
sha256sums=('e83c042e20b20ec80c9f28875412156b29478e894182e8568006d8b84fff88e5')

prepare() {
    cd $pkgname-$pkgver
    # set correct documentation link.
    sed -i 's|http://www.diamondsearch.org|https://github.com/bbuchfink/diamond/|g' src/basic/config.cpp
    sed -i 's|http://www.diamondsearch.org|https://github.com/bbuchfink/diamond/wiki/3.-Command-line-options|g' src/util/command_line_parser.cpp
}

build() {
  cd $pkgname-$pkgver
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=mold" \
    -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,relro -Wl,-z,now,-fuse-ld=mold" \
    -DWITH_ZSTD=ON \
    -DZSTD_LIBRARY=/usr/lib/libzstd.so \
    -DZLIB_INCLUDE_DIR=/usr/include \
    -W no-dev
  cmake --build build
}

check() {
    cd $pkgname-$pkgver
    ctest --test-dir build --output-on-failure
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
