# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=reolink-cli-bin
_pkgname=reolink-cli
pkgver=0.10.6
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
sha256sums_x86_64=('c5bbb393adc81d4938279c254bbe1145c54eff7fcbe5a6ea3eb0e08a935f0974')
sha256sums_aarch64=('6804451b81986536230892bd80426c173f854f862d49d5518e276ffce296192d')

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
