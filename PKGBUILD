# Maintainer: fabse
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: envolution

pkgname=llama.cpp
pkgver=b8966 # renovate: datasource=github-releases depName=ggml-org/llama.cpp
pkgrel=6
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
sha256sums=('23776215e0a00a6d9ef94a54379fb9d5d3fa53e702d6945e40c5f660a297ec12'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '48d6b261315c9175b4b4cea4900bd4d76f2f27112804934db656537485510cd2'
            'fbb8ed942adfe3722bb46ec18b95c2e0320c087dcf996d29a14e4b5587093994'
            '8b7e4ba31a27a27c611d94b8ec99a39eaea0e8ef2afaea53f06795d950fc346d'
            '4730d43503457ac393770df1beb4a740b1bfaa7f6eadd0f5f9920309af7155d7')

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
