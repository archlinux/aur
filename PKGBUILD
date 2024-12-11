# Maintainer: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-vulkan"
pkgver=1.7.2
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with Vulkan optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs' 'openmp' 'vulkan-driver' 'vulkan-icd-loader')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
makedepends=(
  'cmake'
  'git'
)

source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  cmake \
    -B build \
    -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_VULKAN=1

  cmake --build build
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  for i in build/bin/*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${_pkgbase}-${i//build\/bin\//}"
  done
  mv "${pkgdir}/usr/bin/${_pkgbase}-main" \
    "${pkgdir}/usr/bin/${_pkgbase}"
  rm "${pkgdir}/usr/include/"ggml*
  rm "${pkgdir}/usr/lib/libggml.so"

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${_pkgbase}"
}

sha256sums=('d48e1b5b6ee18b931e98ac791eba838f83eb3b81bb8917db37fe9a79fa5e3ccb')
