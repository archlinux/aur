# Maintainer: Bink
pkgname=llama.cpp-cuda-git
_pkgname="${pkgname%-cuda-git}"
pkgver=b10142.r1.88b47a755c
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with NVIDIA CUDA optimizations)"
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
backup=('etc/conf.d/llama.cpp')
depends=(
  ggml-cuda-git
  curl
  gcc-libs
  glibc
  openssl
)
makedepends=(
  cmake
  cuda
  git
  ninja
)
optdepends=(
'ccache: greatly reduce package re-build time'
'nccl: needed for multi-GPU parallelism'
'python-numpy: needed for convert_hf_to_gguf.py'
'python-safetensors: needed for convert_hf_to_gguf.py'
'python-sentencepiece: needed for convert_hf_to_gguf.py'
'python-pytorch: needed for convert_hf_to_gguf.py'
'python-transformers: needed for convert_hf_to_gguf.py'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
  # Grab commit ID and build number.
  local _commit_id _build_number
  _commit_id=$(git -C "${_pkgname}" rev-parse HEAD)
  _build_number=$(git -C "${_pkgname}" rev-list --count HEAD)

  local _cmake_options=(
    -G Ninja
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=ON
    -DLLAMA_BUILD_SERVER=ON
    -DLLAMA_BUILD_NUMBER="${_build_number}"
    -DLLAMA_BUILD_COMMIT="${_commit_id}"
    -DLLAMA_OPENSSL=ON
    -Wno-dev
  )

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

  # Helper libraries.
  #install -Dm755 -t "${pkgdir}/usr/lib/" build/bin/lib*-impl.so

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
