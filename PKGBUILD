# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.4.2
pkgrel=2
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs' 'sdl2')
makedepends=('cmake' 'git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -B ./build \
    -S . \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
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

sha256sums=('1b988dcc77fca55f188dbc4e472f971a80854c1d44309cf3eaab9d5677f175e1')
