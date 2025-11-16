# # Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp-vulkan
_pkgname=${pkgname%%-vulkan}
pkgver=b7075
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with Vulkan GPU optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  python
  vulkan-icd-loader
)
makedepends=(
  cmake
  git
  shaderc
  vulkan-headers
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
)
provides=(${_pkgname})
conflicts=(${_pkgname} libggml ggml stable-diffusion.cpp)
options=(lto !debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('686b84f9a61de38c89f2f67d47baf943e9ed4a40d27437c78b2bafbf0826cf08')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp
}

build() {
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
    -DGGML_VULKAN=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
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
  cmake --build build -- -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
