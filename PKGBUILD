# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="rts5139"
pkgname=("${_pkgname}-git")
pkgver=r6.97512d1
pkgrel=3
pkgdesc="A kernel module for Realtek RTS5129/RTS5139 Card Reader Controller"
url="https://github.com/asymingt/${_pkgname}"
arch=('any')
license=('GPL2')
depends=('')
makedepends=('git' 'linux-headers')
provides=("${_pkgname}")
install="${pkgname}.install"
source=("git://github.com/asymingt/${_pkgname}.git")
sha256sums=('SKIP')

_kernver=`uname -r`

_rts5139="#Load 'rts5139.ko' at boot.

rts5139"

pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_pkgname}"
    echo -e "$_rts5139" | tee rts5139.conf
    make
}

package() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/etc/modules-load.d/"
  install -m 644 rts5139.conf "${pkgdir}/etc/modules-load.d/"
  install -dm 755 "${pkgdir}/usr/lib/modules/${_kernver}/kernel/drivers/scsi/"
  install -m 644 rts5139.ko "${pkgdir}/usr/lib/modules/${_kernver}/kernel/drivers/scsi/"
  gzip "${pkgdir}/usr/lib/modules/${_kernver}/kernel/drivers/scsi/rts5139.ko"
}

# vim:set ts=4 sw=2 ft=sh et:
