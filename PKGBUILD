# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp
pkgver=b5804
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  libggml
  python
  python-numpy
  python-sentencepiece
)
makedepends=(
  cmake
  git
)
optdepends=(python-pytorch)
options=(lto !debug)
source=(
  "git+${url}#tag=${pkgver}"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=('4ac1647efe0fba577396e005235217497cf1a08a6d2fdd1407321fb0ecc53960'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')

build() {
  local _cmake_options=(
    -B build
    -S "${pkgname}"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_CURL=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=ON
    -Wno-dev
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

# check() {
#   ctest --test-dir build --output-on-failure -L 'main|curl' --verbose --timeout 900
# }

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
