# Maintainer: fabse
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: envolution

pkgname=llama.cpp
pkgver=b8994 # renovate: datasource=github-releases depName=ggml-org/llama.cpp
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  python
)
makedepends=(
  cmake
  git
  shaderc
  ninja
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
  'python-gguf: needed for convert_hf_to_gguf.py'
)
provides=(${pkgname})
conflicts=(${pkgname} libggml ggml)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
install='llama.cpp.install'
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  'llama.cpp.conf'
  'llama.cpp.service'
  'llama.cpp.install'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha256sums=('c0fb25d008add462488f65df59bcfad1806608034502feba7dc95216e05becfa'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '48d6b261315c9175b4b4cea4900bd4d76f2f27112804934db656537485510cd2'
            'c534b4c37ff8ac9174a2f6f410daa96d991e8c638f338383ffb07613c771724b'
            'e687106ee9f6a5f0de4f286015f85a60e68d884e8100c67810b709960c354148'
            '402a44f609785fbabc7afca6e8a486ff517933661e9e7f4955fed6574eac9875')

prepare() {
  ln -sf "${pkgname}-${pkgver}" llama.cpp
}
build() {
  local _cmake_options=(
    -G Ninja
    -B build
    -S "${pkgname}"
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
    -DLLAMA_BUILD_NUMBER="${pkgver#b}"
    -Wno-dev
  )
  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    echo "CI = $CI detected, building universal package"
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_CPU_ALL_VARIANTS=ON
      -DGGML_NATIVE=OFF
    )
  else
    _cmake_options+=(
      -DGGML_NATIVE=ON
    )
  fi
  # Allow user-specified additional flags
  if [[ -n "$LLAMA_BUILD_EXTRA_ARGS" ]]; then
    echo "Applied custom CMake build args: $LLAMA_BUILD_EXTRA_ARGS"
    _cmake_options+=($LLAMA_BUILD_EXTRA_ARGS)
  fi
  cmake "${_cmake_options[@]}"
  cmake --build build -- -j $(nproc)
}
package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
  install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/llama-cpp.conf"
  install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/llama-cpp.conf"
}
# vim:set ts=2 sw=2 et:
