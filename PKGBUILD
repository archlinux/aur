# shellcheck disable=2034,2154,2164
#
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>
#
# This package pre-compiles and statically links four dependencies.
# Why is this? It is because neither intgemm nor pathie-cpp are used elsewhere,
# and using protobuf-21 as a dynamic library is a hassle.

pkgname=marian-lite
pkgver=0.2.9
pkgrel=1
pkgdesc="Marian NMT lite - partially static binary"
arch=('x86_64')
url="https://github.com/terslang/marian-lite"
license=('MIT' 'Apache' 'BSD')

depends=(
    'cli11'
    'openblas'
    'sqlitecpp'
    'yaml-cpp'
)
makedepends=('cmake')

_marian_ver="$pkgver-$pkgrel"
_proto_ver=21.12
_intgemm_ver=0.0.3
_pathie_ver=0.1.3
_spm_ver=0.2

source=(
    "marian-lite-${_marian_ver}.tar.gz::https://github.com/terslang/marian-lite/archive/refs/tags/v${_marian_ver}.tar.gz"
    "protobuf-${_proto_ver}.tar.gz::https://github.com/protocolbuffers/protobuf/archive/v${_proto_ver}/protobuf-${_proto_ver}.tar.gz"
    "intgemm-${_intgemm_ver}.tar.gz::https://github.com/kroketio/intgemm/archive/refs/tags/${_intgemm_ver}.tar.gz"
    "pathie-cpp-${_pathie_ver}.tar.gz::https://github.com/kroketio/pathie-cpp/archive/refs/tags/${_pathie_ver}.tar.gz"
    "sentencepiece-browsermt-${_spm_ver}.tar.gz::https://github.com/kroketio/sentencepiece-browsermt/archive/refs/tags/${_spm_ver}.tar.gz"
    "python3.11.patch::https://github.com/protocolbuffers/protobuf/commit/da973aff.patch"
    "fix-abi.patch::https://github.com/protocolbuffers/protobuf/commit/101b6199.patch"
)

sha256sums=(
    '13a681c936f15c0d95d42fa78fc7c468aa3d08e40ee608e080b825098488c809' # marian-lite
    '22fdaf641b31655d4b2297f9981fa5203b2866f8332d3c6333f6b0107bb320de' # protobuf-21.12
    '0d1b0cd471642c8e0c9160aa5ec3d1be0435d65c2f30f0df2b6651d62bb9d428' # intgemm-0.0.3
    'fffd20f3d22034e68383dfddc62610dc9a89ca89cbaeb1ce978ba11d1e98caaf' # pathie-cpp-0.1.3
    '1cdd7b4ef66efad3cfb8c0aa7ac78d648a616b37649c4919056eb94dc3202d29' # sentencepiece-browsermt-0.2
    'def1c370c9d4b91262d8b13ffba39394af96235e33ff96c9808c72e5250e9f27' # python3.11.patch
    '086c54277c592c7b4ec1b70f9868aa4c8288d663077a31868d2ba46638ecb4f3' # fix-abi.patch
)

# ===============================================================================
# prepare
# ===============================================================================

prepare() {
    # --------------------------------------------------------------- protobuf-21
    cd "$srcdir/protobuf-${_proto_ver}"
    patch -Rp1 <"$srcdir/fix-abi.patch"
    patch -Np1 -i "$srcdir/python3.11.patch"

    # --------------------------------------------------------------- marian-lite
    cd "$srcdir/marian-lite-${_marian_ver}"
    grep -rl '<cblas.h>' . |
        xargs sed -i 's|#include <cblas.h>|#include <openblas/cblas.h>|g'
}

# ===============================================================================
# build
# ===============================================================================

build() {
    readonly STAGE="$srcdir/staging"

    # ----------------------------------------------------------------- helper fn
    _build_staged_dep() {
        local name=$1 folder=$2 build_dir="build-${1,,}"
        shift 2

        msg "Building $name..."
        cmake \
            -S "$srcdir/$folder" \
            -B "$srcdir/$build_dir" \
            -D CMAKE_BUILD_TYPE=Release \
            -D CMAKE_INSTALL_PREFIX="$STAGE" \
            -D BUILD_SHARED_LIBS=OFF \
            "$@"

        cmake --build "$srcdir/$build_dir" -j"$(nproc)"
        cmake --install "$srcdir/$build_dir"
    }

    # --------------------------------------------------------- staged sub-builds
    _build_staged_dep "IntGEMM" "intgemm-${_intgemm_ver}"
    _build_staged_dep "Pathie" "pathie-cpp-${_pathie_ver}"
    _build_staged_dep "Protobuf" "protobuf-${_proto_ver}" \
        -D CMAKE_POSITION_INDEPENDENT_CODE=ON \
        -D protobuf_BUILD_TESTS=OFF
    _build_staged_dep "SentencePiece" "sentencepiece-browsermt-${_spm_ver}" \
        -D CMAKE_PREFIX_PATH="$STAGE" \
        -D SPM_BUILD_LIBRARY_ONLY=ON

    # --------------------------------------------------------------- marian-lite
    msg "Building Marian Lite ${pkgver}..."
    cmake \
        -S "$srcdir/marian-lite-${_marian_ver}" \
        -B "$srcdir/build-marian" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_PREFIX_PATH="$STAGE" \
        -D STATIC=OFF \
        -D SHARED=ON \
        -W no-dev

    cmake --build "$srcdir/build-marian" -j"$(nproc)"
}

# ===============================================================================
# package
# ===============================================================================

package() { DESTDIR="$pkgdir" cmake --install "$srcdir/build-marian"; }
