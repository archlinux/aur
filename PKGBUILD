# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgbase=marian-lite
pkgname=('sentencepiece-browsermt' 'marian-lite')
pkgver=0.2.9.1
_marian_ver=0.2.9-1
_proto_ver=21.12
_spm_ver=0.2
pkgrel=1
pkgdesc="NMT Framework and Text Tokenizer"
arch=('x86_64')
url="https://github.com/terslang/marian-lite"

makedepends=(
    'cmake' 'openblas'
    'cli11' 'intgemm' 'pathie-cpp'
    'sqlitecpp' 'yaml-cpp'
)

source=(
    "marian-lite-${_marian_ver}.tar.gz::https://github.com/terslang/marian-lite/archive/refs/tags/v${_marian_ver}.tar.gz"
    "protobuf-${_proto_ver}.tar.gz::https://github.com/protocolbuffers/protobuf/archive/v${_proto_ver}/protobuf-${_proto_ver}.tar.gz"
    "sentencepiece-browsermt-${_spm_ver}.tar.gz::https://github.com/kroketio/sentencepiece-browsermt/archive/refs/tags/${_spm_ver}.tar.gz"
    "python3.11.patch::https://github.com/protocolbuffers/protobuf/commit/da973aff.patch"
    "fix-abi.patch::https://github.com/protocolbuffers/protobuf/commit/101b6199.patch"
)
sha256sums=(
    '13a681c936f15c0d95d42fa78fc7c468aa3d08e40ee608e080b825098488c809'
    '22fdaf641b31655d4b2297f9981fa5203b2866f8332d3c6333f6b0107bb320de'
    '1cdd7b4ef66efad3cfb8c0aa7ac78d648a616b37649c4919056eb94dc3202d29'
    'def1c370c9d4b91262d8b13ffba39394af96235e33ff96c9808c72e5250e9f27'
    '086c54277c592c7b4ec1b70f9868aa4c8288d663077a31868d2ba46638ecb4f3'
)

prepare() {
    cd "$srcdir/protobuf-${_proto_ver}"
    patch -Rp1 <"$srcdir/fix-abi.patch"
    patch -Np1 -i "$srcdir/python3.11.patch"

    cd "$srcdir/marian-lite-${_marian_ver}"
    grep -rlZ '<cblas.h>' . | xargs -0 sed -i 's|#include <cblas.h>|#include <openblas/cblas.h>|g'
}

build() {
    export CFLAGS="$CFLAGS -fPIC"
    export CXXFLAGS="$CXXFLAGS -fPIC"

    local PROTO="$srcdir/protobuf-static"

    msg2 "Building Protobuf ${_proto_ver}..."
    cmake -B build-proto -S "protobuf-${_proto_ver}" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX="$PROTO" \
        -D BUILD_SHARED_LIBS=OFF \
        -D protobuf_BUILD_TESTS=OFF
    cmake --build build-proto -j"$(nproc)"
    cmake --install build-proto

    msg2 "Building SentencePiece ${_spm_ver}..."
    cmake -B build-spm -S "sentencepiece-browsermt-${_spm_ver}" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_PREFIX_PATH="$PROTO" \
        -D BUILD_SHARED_LIBS=OFF \
        -D SPM_BUILD_LIBRARY_ONLY=ON
    cmake --build build-spm -j"$(nproc)"

    DESTDIR="$PROTO" cmake --install build-spm

    msg2 "Building Marian Lite ${pkgver}..."
    cmake -B build-marian -S "marian-lite-${_marian_ver}" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_PREFIX_PATH="$PROTO" \
        -D STATIC=OFF -D SHARED=ON \
        -W no-dev
    cmake --build build-marian -j"$(nproc)"
}

package_sentencepiece-browsermt() {
    pkgdesc="SentencePiece for BrowserMT"
    license=('Apache')
    DESTDIR="$pkgdir" cmake --install "$srcdir/build-spm"
}

package_marian-lite() {
    pkgdesc="Marian NMT lite"
    license=('MIT')
    depends=('openblas' 'sqlitecpp' 'yaml-cpp')
    DESTDIR="$pkgdir" cmake --install "$srcdir/build-marian"
}
