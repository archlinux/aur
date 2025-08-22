# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.7.6 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=3
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with OPENBlas CPU optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('ggml-git' 'sdl2-compat')
makedepends=(
  'cmake'
  'git'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  disable-talk-llama.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/disable-talk-llama.patch"
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
  '166140e9a6d8a36f787a2bd77f8f44dd64874f12dd8359ff7c1f4f9acb86202e'
  '52776f8b0c4a1c117d4b12aaca2bd62ec0094aaa3bac224365b007a9efd0b585'
)
