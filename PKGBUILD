# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=ik-llama.cpp
_pkgname=ik_llama.cpp
pkgver=r3826.ae0ba31f
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
conflicts=(
    libggml
    ggml
    llama.cpp
    llama.cpp-vulkan
    llama.cpp-cuda
    llama.cpp-hip
    ik-llama.cpp-cuda
)
provides=(llama.cpp)

options=(lto !debug)

source=("git+${url}")
sha256sums=("SKIP")

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
        -DLLAMA_USE_SYSTEM_GGML=OFF
        -DGGML_ALL_WARNINGS=OFF
        -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
        -DGGML_BUILD_EXAMPLES=OFF
        -DGGML_BUILD_TESTS=OFF
        -DGGML_BLAS=ON
        -DGGML_BLAS_VENDOR=OpenBLAS
        -DGGML_LTO=ON
        -DGGML_RPC=ON
        -DGGML_NATEVE=ON
        -Wno-dev
    )
    cmake "${_cmake_options[@]}"
    cmake --build build --config Release
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
