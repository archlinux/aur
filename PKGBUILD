# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sentencepiece-browsermt
pkgver=0.2
pkgrel=4
pkgdesc="SentencePiece for BrowserMT"
arch=('x86_64')
url="https://github.com/kroketio/sentencepiece-browsermt"
license=('Apache-2.0')
depends=('protobuf-21')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kroketio/sentencepiece-browsermt/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1cdd7b4ef66efad3cfb8c0aa7ac78d648a616b37649c4919056eb94dc3202d29')
#
# LTO + strip breaks the static archives
#
# makepkg strips .gnu.lto_* sections from every .o/.a (Allan McRae, 2021).
# With LTO, GCC emits slim objects that contain only bytecode; after strip
# the archives become empty (libintgemm.a: 95->0 symbols,
# libsentencepiece-browsermt.a: 811->0). Relinking then leaves the exact
# unresolved symbols seen in the failure.
#
options=(!strip)  ## keeps the LTO sections intact and avoids the problem.

build() {
    cd "$srcdir/sentencepiece-browsermt-$pkgver"
    mkdir -p build && cd build
    cmake .. \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SPM_BUILD_LIBRARY_ONLY=ON \
        -D Protobuf_INCLUDE_DIR="/usr/include/protobuf-21" \
        -D Protobuf_LIBRARY="/usr/lib/protobuf-21/libprotobuf.so" \
        -D Protobuf_LITE_LIBRARY="/usr/lib/protobuf-21/libprotobuf-lite.so" \
        -D Protobuf_PROTOC_EXECUTABLE="/usr/bin/protoc-21"
    make
}

package() {
    cd "$srcdir/sentencepiece-browsermt-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
