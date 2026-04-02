# Maintainer: jman
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=llama.cpp-cuda-essentials-only
_pkgname="${pkgname%-cuda-essentials-only}"
pkgver=b8611.r17.fbd441c379
pkgrel=1
_build_number=0
_commit_id=
pkgdesc="LLM inference in C/C++ with CUDA GPU acceleration (optimized build)"
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  cuda
  curl
  gcc-libs
  glibc
  nvidia-utils
  openmp
)
makedepends=(
  cmake
  git
  ninja
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-cuda" "${_pkgname}-cuda-git" libggml ggml)
options=('!lto')  # LTO is handled by cmake via GGML_LTO
source=(
  "git+https://github.com/ggml-org/llama.cpp.git"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)
backup=('etc/conf.d/llama.cpp')

_llama_targets=(
  llama-cli
  llama-mtmd-cli
  llama-server
  llama-gguf-split
  llama-bench
  llama-perplexity
  llama-quantize
  llama-imatrix
)

pkgver() {
  cd "${_pkgname}" || exit
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${_pkgname}" || exit
  _commit_id=$(git rev-parse --short=7 HEAD)
  _build_number=$(git rev-list --count HEAD)
}

build() {
  # Source /etc/profile to pick up NVCC_CCBIN if the user's session
  # has not been restarted after installing cuda
  if [[ -z "${NVCC_CCBIN}" ]]; then
    source /etc/profile
  fi

  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DLLAMA_BUILD_NUMBER="${_build_number}"
    -DLLAMA_BUILD_COMMIT="${_commit_id}"
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_CUDA=ON
    -DGGML_CUDA_FA=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DGGML_CUDA_GRAPHS=ON
    -DGGML_NATIVE=ON
    -DGGML_LTO=ON
    -DGGML_OPENMP=ON
    -DGGML_CCACHE=ON
    -DGGML_CPU_REPACK=ON
    -DGGML_RPC=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build --target "${_llama_targets[@]}"
}

package() {
  for _bin in "${_llama_targets[@]}"; do
    install -Dm755 "build/bin/${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 llama.cpp.conf "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 llama.cpp.service "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
