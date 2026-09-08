# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Maintainer: Bink
pkgname=ik-llama.cpp-cuda-opt-git
_pkgname="ik_llama.cpp"
pkgver=t0002.r1064.1a2a8604a
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with NVIDIA CUDA optimizations) - fork by ikawrakow, installed in /opt"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ikawrakow/ik_llama.cpp'
license=('MIT')
depends=(
  cuda
  curl
  gcc-libs
  glibc
  nvidia-utils
  openssl
  nccl
  gcc15-libs
)
makedepends=(
  cmake
  gcc15  # CUDA requires gcc15
  git
  ninja
)
optdepends=(
  'ccache: greatly reduce package re-build time'
  'rdma-core: RDMA transport for RPC backend (rebuild required)'
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
)
source=(
  "git+https://github.com/ikawrakow/ik_llama.cpp.git"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=('SKIP'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '99609872ad5deeb64ba969d6c9041f6b8534f6198f181d5b9c02deca9b7ae790')

pkgver() {
  cd "${_pkgname}" || exit
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  # This may not be set if the user's session
  # has not restarted on a new 'cuda' install
  if [[ -z "${NVCC_CCBIN}" ]]; then
    source /etc/profile
  fi

  # Grab commit ID and build number.
  local _commit_id _build_number
  _commit_id=$(git -C "${_pkgname}" rev-parse HEAD)
  _build_number=$(git -C "${_pkgname}" rev-list --count HEAD)

  local _cmake_options=(
    -G Ninja
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX="/opt/${_pkgname}"
    -DCMAKE_INSTALL_RPATH="/opt/${_pkgname}/lib:/usr/lib/nvidia:/usr/lib"
    -DCMAKE_BUILD_RPATH="/opt/${_pkgname}/lib:/usr/lib/nvidia:/usr/lib"
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF # Change to on if you want examples
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_BUILD_SERVER=ON
    -DLLAMA_BUILD_NUMBER="${_build_number}"
    -DLLAMA_BUILD_COMMIT="${_commit_id}"
    -DLLAMA_OPENSSL=ON
    -DGGML_OPENMP=ON
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_CUDA=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DGGML_CUDA_COMPRESSION_MODE=speed
    -DGGML_BLAS=OFF
    -DGGML_VULKAN=OFF
    -Wno-author
  )

  if [[ ${aur_llamacpp_build_universal} == true ]]; then
    echo "Building universal binary [aur_llamacpp_build_universal == true]"
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_NATIVE=OFF
      -DGGML_CPU_ALL_VARIANTS=ON
    )
  else
    # makepkg sets SOURCE_DATE_EPOCH, which would otherwise disable native defaults
    _cmake_options+=(
      -DGGML_NATIVE=ON
      -DCMAKE_CUDA_ARCHITECTURES=native
    )
  fi

  # Allow user-specified additional flags
  if [[ -n "${aur_llamacpp_cmakeopts:-}" ]]; then
    echo "Applying custom CMake options: ${aur_llamacpp_cmakeopts}"
    # shellcheck disable=SC2206 # intentional word splitting
    _cmake_options+=(${aur_llamacpp_cmakeopts})
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/ik-llama.cpp-opt"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/ik-llama.cpp-opt.service"
}
