# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.5.2
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs')
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

sha256sums=('be9c4d5d4b5f28f02e36f28e602b7d2dcfd734dd1c834ddae91ae8db601e951f')
