# Maintainer: Wuxxin <wuxxin@gmail.com>

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-hip"
pkgver=1.8.3 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (using system llama.cpp-hip)"
arch=('x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=(
    'hipblas'
    'rocblas'
    'hip-runtime-amd'
    'sdl2-compat'
    'llama.cpp-hip'
)
conflicts=("${_pkgbase}" "${_pkgbase}-cuda" "${_pkgbase}-clblast" "${_pkgbase}-openvino")
provides=("${_pkgbase}")
makedepends=(
    'cmake'
    'git'
    'rocm-hip-sdk'
    'rocm-toolchain'
)
source=(
    "${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
    '870ba21409cdf66697dc4db15ebdb13bc67037d76c7cc63756c81471d8f1731a'
)

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    # patch -Np1 -i "${srcdir}/xxx.patch"
}

build() {
    # ROCm architecture detection
    _GPU_TARGETS="$(rocm-supported-gfx)"
    if test -n "$GPU_TARGETS"; then _GPU_TARGETS="$GPU_TARGETS"; fi
    if test -n "$AMDGPU_TARGETS"; then _GPU_TARGETS="$AMDGPU_TARGETS"; fi

    export GPU_TARGETS="${_GPU_TARGETS}"
    echo "Building for ROCm architectures: ${GPU_TARGETS}"

    # Set compiler to hipcc and ROCm paths
    export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
    export ROCM_PATH="$ROCM_HOME"
    export HIP_ROOT_DIR="$ROCM_HOME"
    export HIP_PLATFORM=amd
    export CC=/opt/rocm/bin/hipcc
    export CXX=/opt/rocm/bin/hipcc

    # Clear flags that might interfere with hipcc
    export CFLAGS=""
    export CXXFLAGS=""
    export LDFLAGS=""

    cmake \
        -B "${srcdir}/build" \
        -S "${srcdir}/${_pkgbase}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWHISPER_SDL2=1 \
        -DWHISPER_FFMPEG=1 \
        -DWHISPER_BUILD_SERVER=1 \
        -DWHISPER_BUILD_TESTS=0 \
        -DWHISPER_USE_SYSTEM_GGML=1 \
        -DGGML_HIP=ON \
        -DGGML_HIPBLAS=ON \
        -DCMAKE_C_COMPILER=/opt/rocm/bin/hipcc \
        -DCMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc

    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    for i in bench command main stream; do
        if test -e "${srcdir}/build/bin/$i"; then
            rm "${srcdir}/build/bin/$i"
        fi
    done
    cp -r "${srcdir}/build/bin" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/LICENSE" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
