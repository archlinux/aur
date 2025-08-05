# Maintainer: envolution
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|prebuild=setcommitid.sh,envset_aur_llamacpp_build_universal=true| https://github.com/envolution/aur/blob/main/maintain/build/llama.cpp-cuda-f16/setcommitid.sh

: ${aur_llamacpp_build_universal:=false}

pkgname=llama.cpp-cuda-f16
_pkgname="${pkgname%-cuda-f16}"
pkgver=b6089
pkgrel=1
_build_number=6089
_commit_id=ec428b0
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with NVIDIA CUDA optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
depends=(
  cuda
  curl
  gcc-libs
  glibc
  nvidia-utils
)
makedepends=(
  cmake
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
)
provides=(${_pkgname})
conflicts=(${_pkgname} libggml ggml)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=('6b32557024e487545792397d7620561951012bf2a3def54f979835ab097c488b'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp
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
    -DLLAMA_CURL=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_CUDA=ON
    -DGGML_CUDA_F16=ON
    -DGGML_BUILD_SERVER=ON
    -DLLAMA_BUILD_NUMBER="${_build_number}"
    -DLLAMA_BUILD_COMMIT="${_commit_id}"
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
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
# vim:set ts=2 sw=2 et:
