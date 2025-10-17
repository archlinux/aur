# Maintainer: envolution
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|prebuild=setcommitid.sh,envset_aur_llamacpp_build_universal=true| https://github.com/envolution/aur/blob/main/maintain/build/llama.cpp/setcommitid.sh

: ${aur_llamacpp_build_universal:=false}

pkgname=llama.cpp
pkgver=b6788
pkgrel=1
_build_number=6788
_commit_id=342c728
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
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
conflicts=(libggml ggml)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=('f0884814c696d5976610739ddd6a1f43ae04ed3057d27c0895ea679b1282d6d9'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')

prepare() {
  ln -sf "${pkgname}-${pkgver}" llama.cpp
}
build() {

  local _cmake_options=(
    -B build
    -S "${pkgname}"
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
    -DGGML_BLAS=OFF
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

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
# vim:set ts=2 sw=2 et:
