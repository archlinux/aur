# Maintainer: Joshua Holmer <jholmer.in@gmail.com>

_plug=wnnm
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=13.141baae
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT Version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-WNNM'
license=('GPL2')
depends=(
    'vapoursynth'
)
makedepends=(
    'git'
    'gcc'
    'ninja'
    'cmake'
    'python-pip'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
    "${_plug}::git+https://github.com/WolframRhodium/VapourSynth-WNNM.git"
    "vectorclass.zip::https://github.com/vectorclass/version2/archive/refs/tags/v2.01.04.zip"
)
sha256sums=(
    'SKIP'
    '01e1cce8e88dae24d28ff2d8e150fc6606fcc43ec350fb2c90b66aedb3a1ba06'
)
options=('debug')

pkgver() {
    cd "${_plug}"

    _rev=$(git rev-list --count --all)
    _hash=$(git rev-parse --short HEAD)
    printf "%s.%s" "$_rev" "$_hash"
}

prepare() {
    cd "${_plug}"

    HAS_AVX2=$(gcc -v -E -x c /dev/null -o /dev/null -march=native 2>&1 | grep mavx2 | wc -l)
    AVX2_FLAG=""
    if [[ $HAS_AVX2 == "1" ]]; then
        AVX2_FLAG="-mavx2"
    fi

    # There is an intel-oneapi-mkl package in AUR, but it doesn't work.
    pip install mkl-static

    rm -rf version2-2.01.04 vectorclass
    unzip ../vectorclass.zip
    mv version2-2.01.04 vectorclass

    CXX=g++ cmake -S . -B build -G Ninja -LA \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_CXX_FLAGS="-Wall $AVX2_FLAG -mfma -ffast-math" \
        -D MKL_LINK=static \
        -D MKL_THREADING=sequential \
        -D MKL_INTERFACE=lp64 \
        -D VCL_HOME="$(pwd)/vectorclass" \
        -D VS_INCLUDE_DIR="/usr/include/vapoursynth"
}

build() {
    cd "${_plug}"

    cmake --build build
}

package() {
    install -Dm755 "${_plug}/build/libwnnm.so" "${pkgdir}/usr/lib/vapoursynth/libwnnm.so"
    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
