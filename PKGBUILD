# Maintainer: MaryJaneInChain <maryjaneinchain@gmail.com>
# Contributor: robertfoster

_pkgname=whisper.cpp
pkgname=whisper.cpp-cuda
pkgver=1.5.4
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs' 'cuda')
makedepends=('cmake' 'git')
provides=('whisper.cpp')

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  cmake -B ./build \
    -S . \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DWHISPER_CUBLAS=1

  cmake --build ./build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  cmake --install ./build

  for i in build/bin/*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${_pkgname}-${i//build\/bin\//}"
  done
  mv "${pkgdir}/usr/bin/${_pkgname}-main" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

sha256sums=('06eed84de310fdf5408527e41e863ac3b80b8603576ba0521177464b1b341a3a')
