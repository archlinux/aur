# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=ik-llama.cpp
_pkgname=ik_llama.cpp
pkgver=r3844.a3a52300
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

source=()
sha256sums=()

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
        -DGGML_NATIVE=ON
        -Wno-dev
    )
    cmake "${_cmake_options[@]}"
    cmake --build build --config Release
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
