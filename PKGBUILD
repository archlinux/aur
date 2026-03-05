# Maintainer: Bink
: ${aur_llamacpp_build_universal:=false}
pkgname=ik-llama.cpp-cuda-git
_pkgname="ik_llama.cpp"
pkgver=t0002.r382.528cadb0
pkgrel=1
_build_number=0
_commit_id=
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with NVIDIA CUDA optimizations) - fork by ikawrakow"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ikawrakow/ik_llama.cpp'
license=('MIT')
depends=(
  cuda
  curl
  gcc-libs
  glibc
  nvidia-utils
  nccl
)
makedepends=(
  cmake
  git
  openssl
)
optdepends=(
'python-numpy: needed for convert_hf_to_gguf.py'
'python-safetensors: needed for convert_hf_to_gguf.py'
'python-sentencepiece: needed for convert_hf_to_gguf.py'
'python-pytorch: needed for convert_hf_to_gguf.py'
'python-transformers: needed for convert_hf_to_gguf.py'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" libggml ggml llama.cpp)
source=(
"git+https://github.com/ikawrakow/ik_llama.cpp.git"
llama.cpp.conf
llama.cpp.service
)
sha256sums=('SKIP'
'53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
'0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')

pkgver() {
  cd "${_pkgname}" || exit
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${_pkgname}" || exit
  # Get the latest commit hash
  _commit_id=$(git rev-parse HEAD)
  _build_number=$(git rev-list --count HEAD)
  cd ..

  ln -sf "${_pkgname}" llama.cpp
}

build() {
  # This may not be set if the user's session
  # has not restarted on a new 'cuda' install
  if [[ -z "${NVCC_CCBIN}" ]]; then
    source /etc/profile
  fi

  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_CUDA=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DLLAMA_BUILD_SERVER=ON
    -DLLAMA_BUILD_NUMBER="${_build_number}"
    -DLLAMA_BUILD_COMMIT="${_commit_id}"
    -DLLAMA_OPENSSL=ON
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
    # we lose GGML_NATIVE_DEFAULT due to how makepkg includes
    # $SOURCE_DATE_EPOCH in ENV
    _cmake_options+=(
      -DGGML_NATIVE=ON
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
