# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp-hip
_pkgname="${pkgname%-hip}"
pkgver=b6351
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with AMD ROCm optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggml-org/llama.cpp'
api_url='https://api.github.com/repos/ggml-org/llama.cpp/releases/latest'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  hip-runtime-amd
  hipblas
  openmp
  python
  rocblas
)
makedepends=(
  cmake
  git
  rocm-hip-sdk
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
source=()
sha256sums=()

prepare() {
  cd "$srcdir"

  local _latest_tag
  _latest_tag=$(curl -s "${api_url}" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

  # 仅使用刚获取的标签进行浅克隆, 避免脱离 Head 提示
  msg2 "Cloning the latest release tag: ${_latest_tag}"
  git -c advice.detachedHead=false clone --depth 1 --single-branch --branch "${_latest_tag}" "${url}" "${_pkgname}"
}

pkgver() {
  # 使用 API 获取最新发布的标签
  curl -s "${api_url}" | \
    grep '"tag_name":' | \
    sed -E 's/.*"([^"]+)".*/\1/'
}

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
    -DGGML_HIP_GRAPHS=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DGGML_NATIVE=ON
    -Wno-dev
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
