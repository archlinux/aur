# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgbase='black-magic-debug'
pkgname=(black-magic-debug-app black-magic-debug-udev)
pkgver=1.10.2
pkgrel=1
pkgdesc='Plug&Play in application debugger for microcontrollers'
arch=('any')
url='https://black-magic.org'
license=('GPL' 'BSD' 'MIT')
makedepends=('git' 'hidapi' 'python')
source=("https://github.com/blackmagic-debug/blackmagic/releases/download/v${pkgver}/blackmagic-full-source-v${pkgver//./_}.tar.gz")
sha256sums=('c8e8c910d7b06522ac48fc99aa192aa682050b735db978db0df2fa557b961d88')
_source="blackmagic-full-source-v${pkgver//./_}"

build() {
  cd "${_source}"
  make PROBE_HOST=hosted HOSTED_BMP_ONLY=0 ENABLE_RTT=1 ADVERTISE_NOACKMODE=1
}

package_black-magic-debug-udev() {
  conflicts=('black-magic-udev' 'black-magic-debug-udev')
  provides=('black-magic-debug-udev')

  cd "${_source}"
  install -Dm 644 driver/99-blackmagic-uucp.rules "${pkgdir}"/usr/lib/udev/rules.d/99-blackmagic-uucp.rules
}

package_black-magic-debug-app() {
  conflicts=('black-magic-debug-app')
  provides=('black-magic-debug-app')
  depends=('libusb' 'libftdi' 'libhidapi-libusb.so')

  cd "${_source}"
  install -Dm 755 src/blackmagic "${pkgdir}"/usr/bin/blackmagic
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgbase}" COPYING*
}
