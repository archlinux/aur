# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=reolink-cli-bin
_pkgname=reolink-cli
pkgver=0.10.5
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
sha256sums_x86_64=('f7c9f353cf8ae13daf7ffce1ce2a2edd81553cafcebe1fbbfc8ea7f4c0a14c1f')
sha256sums_aarch64=('76d6f4822ffc7bc4d5c2087b5157220badd0ba20cb3b20a5714b5dcb13f8354b')

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
