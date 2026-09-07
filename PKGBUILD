# Maintainer: Bink
# Set true for a portable CPU/CUDA build (all CPU variants, no -march=native).
: "${aur_llamacpp_build_universal:=false}"
pkgname=llama.cpp-cuda-git
_pkgname="${pkgname%-cuda-git}"
pkgver=b10830.r0.465e49b9ce
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with NVIDIA CUDA optimizations)"
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
backup=('etc/conf.d/llama.cpp')
depends=(
  cuda
  curl
  gcc-libs
  glibc
  nvidia-utils
  openssl
)
makedepends=(
  cmake
  gcc15   # CUDA does not yet support GCC 16
  git
  ninja
)
optdepends=(
  'ccache: greatly reduce package re-build time'
  'nccl: needed for multi-GPU parallelism (rebuild required)'
  'rdma-core: RDMA transport for RPC backend (rebuild required)'
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
)
provides=(
  "${_pkgname}"
  libggml
  libggml.so
  ggml
  ggml-cuda-git
)
conflicts=(
  "${_pkgname}"
  libggml
  ggml
  ggml-cuda-git
)
replaces=(ggml-cuda-git)
source=(
  "git+https://github.com/ggml-org/llama.cpp.git"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=('SKIP'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')
b2sums=('SKIP'
        '088e6b702e42bf1af019f69c8a85b0cd1196599e12f196e086ea1271e1800540947d1b51e3500821ec4556386f8e3c8217c0ad03570b764b85016827648939e7'
        '56e8e6e99c37f9baa1db5e3f8956f48a59bdbdc48797ae9b41292f0d1cdc3e41e5174bd7d721f3db84587ca271b11b480525e8c32cdb0f17f689b5537623c0a7')

pkgver() {
  cd "${_pkgname}" || exit
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  # Drop any prior build tree so a dirty CMake cache cannot keep system ggml on.
  rm -rf build

  if ! type -P nvcc &>/dev/null && [[ -d /opt/cuda/bin ]]; then
    export PATH="/opt/cuda/bin:$PATH"
  fi

  # Grab commit ID and build number.
  local _commit_id _build_number
  _commit_id=$(git -C "${_pkgname}" rev-parse HEAD)
  _build_number=$(git -C "${_pkgname}" rev-list --count HEAD)

  # Use GCC 15 as host compiler for nvcc (CUDA does not yet support GCC 16).
  # Override via: aur_llamacpp_cmakeopts="-DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-XX"
  local _nvcc_host_cxx="${CUDAHOSTCXX:-/usr/bin/g++-15}"

  local _cmake_options=(
    -G Ninja
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_CUDA_HOST_COMPILER="${_nvcc_host_cxx}"
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_ALL_WARNINGS=OFF
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_BUILD_SERVER=ON
    -DLLAMA_BUILD_NUMBER="${_build_number}"
    -DLLAMA_BUILD_COMMIT="${_commit_id}"
    -DLLAMA_OPENSSL=ON
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DGGML_OPENMP=ON
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_CUDA=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DGGML_CUDA_COMPRESSION_MODE=speed
    -DGGML_CUDA_GRAPHS=ON
    -DGGML_LLAMAFILE=ON
    -DGGML_BLAS=OFF
    -DGGML_VULKAN=OFF
    -Wno-dev
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
      -DGGML_BACKEND_DL=OFF
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
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
