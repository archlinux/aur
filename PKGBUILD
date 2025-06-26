# Maintainer: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-vulkan"
pkgver=1.7.6 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with Vulkan optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('ggml-vulkan-git' 'sdl2-compat')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
makedepends=(
  'cmake'
  'git'
)

source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${_pkgbase}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWHISPER_SDL2=1 \
    -DWHISPER_USE_SYSTEM_GGML=1

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  cd "${srcdir}/build/bin"
  for i in whisper-*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${i}"
  done

  install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('166140e9a6d8a36f787a2bd77f8f44dd64874f12dd8359ff7c1f4f9acb86202e')
