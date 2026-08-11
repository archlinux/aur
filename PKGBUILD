# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=reolink-cli-bin
_pkgname=reolink-cli
pkgver=0.11.0
pkgrel=1
pkgdesc="The CLI for devices manufactured by Reolink"
arch=('x86_64' 'aarch64')
url="https://github.com/reolink/reolink-cli"
license=('custom: proprietary')
# Prebuilt proprietary binaries: the EULA (section 2b) forbids modifying the
# Software, and stripping would alter the shipped ELFs.
options=(!strip)
depends=('glibc')
optdepends=('npm: set up the reolink AI-agent skill via `npx skills add`')
provides=('reolink-cli' 'reolink-gateway')
conflicts=('reolink-cli' 'reolink-gateway')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-external-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-external-linux-arm64.tar.gz")
sha256sums_x86_64=('306a0bc95bfa3cc98a5ff08c8343af24d267a56287b667e8ffb1bc0ff24848bc')
sha256sums_aarch64=('b21c14913e7b002f1645d970ff4602e6a23db63fda4de6092186062d8c5ee6f3')

package() {
  local _arch=x86_64
  [ "$CARCH" = aarch64 ] && _arch=arm64

  cd "${srcdir}/${_pkgname}-${pkgver}-external-linux-${_arch}"

  # binaries
  install -Dm755 -t "${pkgdir}/usr/bin" bin/reolink-cli bin/reolink-gateway

  # documentation
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md

  # license: the EULA (section 3a) requires it and THIRD-PARTY-LICENSES.txt to
  # travel with the binaries unaltered
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" EULA.txt THIRD-PARTY-LICENSES.txt
}
