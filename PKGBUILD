# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=ik-llama.cpp
_pkgname=ik_llama.cpp
pkgver=r4072.21fc9322
pkgrel=1
pkgdesc="llama.cpp fork with additional SOTA quants and improved performance (OpenBLAS Backend)"
arch=(x86_64 armv7h aarch64)
url="https://github.com/ikawrakow/ik_llama.cpp"
license=("MIT")
depends=(
    openblas
    openblas64
    blas64-openblas
    curl
    gcc-libs
    glibc
    python
)
makedepends=(
    cmake
    git
)
optdepends=(
    'python-numpy: needed for convert_hf_to_gguf.py'
    'python-safetensors: needed for convert_hf_to_gguf.py'
    'python-sentencepiece: needed for convert_hf_to_gguf.py'
    'python-pytorch: needed for convert_hf_to_gguf.py'
    'python-transformers: needed for convert_hf_to_gguf.py'
)
conflicts=(
    libggml
    ggml
    llama.cpp
    llama.cpp-vulkan
    llama.cpp-cuda
    llama.cpp-hip
    ik-llama.cpp-cuda
    ik-llama.cpp-vulkan
)
provides=(llama.cpp)

options=(lto !debug)

backup=("etc/conf.d/llama.cpp")
source=(
    "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
    "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
)
sha256sums=('0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d'
            'e4856f186f69cd5dbfcc4edec9f6b6bd08e923bceedd8622eeae1a2595beb2ec')

prepare() {
    cd "$srcdir"
    git clone --single-branch --branch main "${url}" "${_pkgname}"
}

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    local _cmake_options=(
        -B build
        -S "${_pkgname}"
        -DCMAKE_INSTALL_PREFIX='/usr'
        -DBUILD_SHARED_LIBS=ON
        -DLLAMA_CURL=ON
        -DLLAMA_BUILD_TESTS=OFF
        # -DLLAMA_USE_SYSTEM_GGML=OFF
        -DGGML_ALL_WARNINGS=OFF
        -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
        -DGGML_BUILD_EXAMPLES=OFF
        -DGGML_BUILD_TESTS=OFF
        -DGGML_BLAS=ON
        -DGGML_BLAS_VENDOR=OpenBLAS
        -DGGML_LTO=ON
        -DGGML_RPC=ON
        -Wno-dev
    )

    # 检查是否在 CI 环境中构建
    if [ -n "$CI" ] && [ "$CI" != 0 ]; then
        msg2 "CI = $CI detected, building universal package"
        # 启用通用构建
        _cmake_options+=(
        -DGGML_BACKEND_DL=ON
        -DGGML_CPU_ALL_VARIANTS=ON
        -DGGML_NATIVE=OFF
        )
    else
        # 本地构建, 针对当前设备优化
        _cmake_options+=(
        -DGGML_NATIVE=ON
        )
    fi

    cmake "${_cmake_options[@]}"
    cmake --build build --config Release -- -j $(nproc)
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
    install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"

    msg2 "llama.cpp.service is now available"
    msg2 "llama-server arguments are in /etc/conf.d/llama.cpp"
}
