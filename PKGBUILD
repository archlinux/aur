# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=marian-lite
pkgver=0.2.9.1
_pkgver=0.2.9-1
pkgrel=2
pkgdesc="Marian NMT lite"
arch=('x86_64')
url="https://github.com/terslang/marian-lite"
license=('MIT')
depends=('openblas' 'sqlitecpp' 'yaml-cpp'
    'protobuf-21')
makedepends=('cmake' 'openblas' 'cli11' 'intgemm' 'pathie-cpp'
    'sqlitecpp' 'yaml-cpp' 'protobuf-21' 'sentencepiece-browsermt')
source=("https://github.com/terslang/marian-lite/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('13a681c936f15c0d95d42fa78fc7c468aa3d08e40ee608e080b825098488c809')

prepare() {
    cd "$srcdir/marian-lite-$_pkgver"
    grep -rlZ '<cblas.h>' . | xargs -0 sed -i 's|#include <cblas.h>|#include <openblas/cblas.h>|g'
}

build() {
    cd "$srcdir/marian-lite-$_pkgver"
    mkdir -p build && cd build
    cmake .. \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D STATIC=OFF -D SHARED=ON \
        -D Protobuf_INCLUDE_DIR="/usr/include/protobuf-21" \
        -D Protobuf_LIBRARY="/usr/lib/protobuf-21/libprotobuf.so" \
        -D Protobuf_LITE_LIBRARY="/usr/lib/protobuf-21/libprotobuf-lite.so" \
        -D Protobuf_PROTOC_EXECUTABLE="/usr/bin/protoc-21"
    make
}

package() {
    cd "$srcdir/marian-lite-$_pkgver/build"
    make DESTDIR="$pkgdir/" install
}
