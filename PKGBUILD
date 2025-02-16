# Maintainer: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-openvino"
pkgver=1.7.4 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=2
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with OpenVINO run-time)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('openvino')
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
    -DWHISPER_OPENVINO=1

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

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${_pkgbase}"
}

sha256sums=('9ce7b33028793fcbf62f81f1fd087af7778dace8772eaba8c43c66bf0c8a3eed')
