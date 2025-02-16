# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.7.4 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=2
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with OPENBlas CPU optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('blas-openblas')
makedepends=(
  'cmake'
  'git'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -B build \
    -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_OPENBLAS=1

  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  for i in build/bin/*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${pkgname}-${i//build\/bin\//}"
  done
  mv "${pkgdir}/usr/bin/${pkgname}-main" \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('9ce7b33028793fcbf62f81f1fd087af7778dace8772eaba8c43c66bf0c8a3eed')
