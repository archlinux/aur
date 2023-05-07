# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.4.0
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs' 'sdl2')
makedepends=('cmake' 'git')

source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -B ./build \
    -S . \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DWHISPER_SUPPORT_SDL2=ON \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build ./build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake --install ./build

  for i in build/bin/*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${pkgname}-${i//build\/bin\//}"
  done
  mv "${pkgdir}/usr/bin/${pkgname}-main" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('b2e34e65777033584fa6769a366cdb0228bc5c7da81e58a5e8dc0ce94d0fb54e')
