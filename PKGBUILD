# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp-opencl
_pkgname="${pkgname%-opencl}"
pkgver=b4142
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with OpenCL optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
depends=(
  blas-openblas
  blas64-openblas
  curl
  gcc-libs
  glibc
  openmp
  python
  python-numpy
  python-sentencepiece
)
makedepends=(
  clblast
  cmake
  git
  ocl-icd
  opencl-clhpp
  opencl-headers
  pkgconf
)
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(lto)
source=(
  "git+${url}#tag=${pkgver}"
  "git+https://github.com/nomic-ai/kompute.git"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=('9234c7a3be2fdd622f629a4aecb9f2098ff7f0668f9751f353733804c991fdd6'
            'SKIP'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '065f69ccd7ac40d189fae723b58d6de2a24966e9b526e0dbfa3035a4c46a7669')

prepare() {
  cd "${_pkgname}"

  git submodule init
  git config submodule.kompute.url "${srcdir}/kompute"
  git -c protocol.file.allow=always submodule update
}

build() {
  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DGGML_NATIVE=OFF
    -DGGML_AVX2=OFF
    -DGGML_AVX=OFF
    -DGGML_F16C=OFF
    -DGGML_FMA=OFF
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DBUILD_SHARED_LIBS=OFF
    -DGGML_STATIC=ON
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DLLAMA_CURL=ON
    -DGGML_BLAS=ON
    -DGGML_CLBLAST=ON
    -Wno-dev
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm "${pkgdir}/usr/include/"ggml*
  rm "${pkgdir}/usr/lib/"lib*.a

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
