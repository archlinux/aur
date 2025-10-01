# Maintainer: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-openvino"
pkgver=1.8.0 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with OpenVINO run-time)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('openvino' 'sdl2-compat')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
makedepends=(
  'cmake'
  'git'
)
source=(
  "${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  disable-deprecated.patch
)

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  patch -Np1 -i "${srcdir}/disable-deprecated.patch"
}

build() {
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${_pkgbase}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWHISPER_OPENVINO=1 \
    -DWHISPER_SDL2=1 \
    -DWHISPER_BUILD_SERVER=0 \
    -DWHISPER_BUILD_TESTS=0

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  cp -r "${srcdir}/build/bin" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('c006a5e472ee41e7a733d0bf7326e339c8b281d3a91a1c8a35468fa0a051940f'
            '5f880edae417c7083a9403260e5c381285e4c52ccc39f127c6510fdfa249c1ad')
