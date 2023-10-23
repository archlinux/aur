# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>
# Contributor: Tad <tad@spotco.us>
pkgname=intel-real-ucode-git
pkgver=20231021.ba8eaf5
pkgrel=1
pkgdesc="Actually provides the latest CPU microcode for Intel"
arch=('any')
license=('custom')
makedepends=('iucode-tool' 'git')
conflicts=('intel-ucode')
provides=('intel-ucode')
source=('CPUMicrocodes::git+https://github.com/platomav/CPUMicrocodes')
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/CPUMicrocodes"
  git log -1 --pretty='format:%cd.%h' --date=format:'%Y%m%d'
}

build() {
  set -eo pipefail

  iucode_tool --ignore-broken --overwrite --write-earlyfw=intel-ucode.img CPUMicrocodes/Intel/*.bin
}

package() {
  install -Dt "${pkgdir}/boot" -m644 intel-ucode.img

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 CPUMicrocodes/Intel/LICENSE
}
