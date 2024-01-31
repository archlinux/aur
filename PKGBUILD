# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=diamond
pkgver=2.1.9
pkgrel=1
pkgdesc="High performance sequence aligner for protein and translated DNA searches with big sequence data. https://doi.org/10.1038/s41592-021-01101-x"
arch=('x86_64')
url="https://github.com/bbuchfink/diamond"
license=('GPL3')
depends=('gcc-libs' 'zlib' 'zstd' 'blast+' 'glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbuchfink/diamond/archive/v$pkgver.tar.gz")
sha256sums=('4cde9df78c63e8aef9df1e3265cd06a93ce1b047d6dba513a1437719b70e9d88')

build() {
  cd $pkgname-$pkgver
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
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
