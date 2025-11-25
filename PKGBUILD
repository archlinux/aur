# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>
# Contributor: Tad <tad@spotco.us>
pkgname=intel-real-ucode-git
pkgver=20251117.2bd1bd0
pkgrel=1
pkgdesc="Actually provides the latest CPU microcode for Intel"
arch=('any')
license=('custom')
makedepends=('iucode-tool' 'git')
replaces=('microcode_ctl')
conflicts=('intel-ucode')
provides=('intel-ucode')
url='https://github.com/platomav/CPUMicrocodes'
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
  set -euo pipefail
  
  cd "${srcdir}/CPUMicrocodes"
  git log -1 --pretty='format:%cd.%h' --date=format:'%Y%m%d'
}

build() {
  set -euo pipefail

  mkdir -p intel-ucode
  iucode_tool --verbose --ignore-broken --overwrite --write-firmware=./intel-ucode/ --write-earlyfw=intel-ucode.img CPUMicrocodes/Intel/*.bin
}

package() {
  set -euo pipefail
  
  install -vDm 644 intel-ucode/* -t "$pkgdir/usr/lib/firmware/intel-ucode/"
  install -D -m0644 intel-ucode.img "${pkgdir}"/boot/intel-ucode.img
  install -D -m0644 CPUMicrocodes/Intel/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
