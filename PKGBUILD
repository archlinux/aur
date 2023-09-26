# Maintainer: Tomasz Zok <tomasz(dot)zok(at)gmail(dot)com>

_pkgbase=rtl8852au
pkgname=rtl8852au-dkms-git
pkgver=r72.803fc78
pkgrel=1
pkgdesc="The WiFi driver for Realtek chipsets RTL8832AU and RTL8852AU (e.g. ASUS USB-AX56, D-Link DW-AX1850, TP-Link AX1800) "
arch=('x86_64')
url="https://github.com/lwfinger/rtl8852au"
license=('GPL2')
depends=('dkms' 'usb_modeswitch')
makedepends=('git')
conflicts=("${_pkgbase}")
source=('git+https://github.com/lwfinger/rtl8852au'
        '40-rtl8852au-usb-modeswitch.rules')
sha256sums=('SKIP'
            '0764d1a35efc5434a43e685f5a1ea97019b10e124f04ddadbe89b7eb2ec88998')

pkgver() {
  cd "${_pkgbase}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  # Copy dkms.conf
  install -Dm644 "${srcdir}/${_pkgbase}"/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r "${srcdir}/${_pkgbase}"/* "${pkgdir}"/usr/src/"${_pkgbase}-${pkgver}"/

  # Copy udev rule preventing from showing the USB dongle as mass storage
  install -Dm644 40-rtl8852au-usb-modeswitch.rules "${pkgdir}"/etc/udev/rules.d/40-rtl8852au-usb-modeswitch.rules
}

