# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=reolink-cli-bin
_pkgname=reolink-cli
pkgver=0.14.2
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
sha256sums_x86_64=('c6c6c7f3b838347d937be88790d8e0cf731b2096e9f4117d3b09eb1461bc03a7')
sha256sums_aarch64=('9a533f25a07ad6355f0be89a1fef4cbe793ce983bd55090640f6c099765a4ddd')

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
