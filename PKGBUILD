# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp-hip
_pkgname="${pkgname%-hip}"
pkgver=b5854
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with AMD ROCm optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  hip-runtime-amd
  hipblas
  openmp
  python
  python-numpy
  python-sentencepiece
  rocblas
)
makedepends=(
  cmake
  git
  rocm-hip-sdk
)
optdepends=(python-pytorch)
provides=(${_pkgname})
conflicts=(${_pkgname} libggml ggml)
options=(lto !debug)
source=(
  "git+${url}#tag=${pkgver}"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=('23656222cea8e27a296c47fecf39bfbd9acf9dc2b56f3ed142cd572d8576c5e0'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')

build() {
  export CC=/opt/rocm/llvm/bin/clang
  export CXX=/opt/rocm/llvm/bin/clang++
  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_CURL=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_HIP=ON
    -Wno-dev
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
