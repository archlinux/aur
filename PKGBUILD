# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.8.4 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with OpenBLAS + Vulkan optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('libggml-git' 'sdl2-compat')
makedepends=(
  'cmake'
  'git'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  disable-deprecated.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/disable-deprecated.patch"
}

build() {
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWHISPER_SDL2=1 \
    -DWHISPER_BUILD_SERVER=0 \
    -DWHISPER_BUILD_TESTS=0 \
    -DWHISPER_USE_SYSTEM_GGML=1

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  cp -r ${srcdir}/build/bin "${pkgdir}"/usr
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=(
  'b26f30e52c095ccb75da40b168437736605eb280de57381887bf9e2b65f31e66'
  '5f880edae417c7083a9403260e5c381285e4c52ccc39f127c6510fdfa249c1ad'
)
