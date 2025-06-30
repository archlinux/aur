# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=diamond
pkgver=2.1.12
pkgrel=2
pkgdesc="High performance sequence aligner for protein and translated DNA searches with big sequence data. https://doi.org/10.1038/s41592-021-01101-x"
arch=('x86_64')
url="https://github.com/bbuchfink/diamond"
license=('GPL-3.0-only')
depends=('gcc-libs' 'zlib' 'zstd' 'glibc' 'blast+')
#'blast+' causes build to fail (https://github.com/bbuchfink/diamond/issues/879),
# Hence 'ncbi-tools++' being used in place as suggested by upstream
makedepends=('cmake' 'mold')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbuchfink/diamond/archive/v$pkgver.tar.gz")
sha256sums=('0a11a09ee58f95a3b2e864d61957066faae8a37abaa120353c0faad5d0ff0778')

prepare() {
    cd $pkgname-$pkgver
    # enable build with newer version of cmake
    sed -i 's/cmake_minimum_required (VERSION 2.6)/cmake_minimum_required (VERSION 3.5)/g' CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold" \
    -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=mold" \
    -DWITH_ZSTD=ON \
    -DBLAST_INCLUDE_DIR=/usr/include/ncbi-tools++ \
    -DBLAST_LIBRARY_DIR=/usr/lib/ \
    -DZSTD_LIBRARY=/usr/lib/libzstd.so \
    -DZLIB_INCLUDE_DIR=/usr/include \
    -Wno-dev

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
