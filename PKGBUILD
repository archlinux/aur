# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgbase='black-magic-debug'
pkgname=(black-magic-debug-app black-magic-debug-udev)
pkgver=1.9.0
pkgrel=1
pkgdesc='Plug&Play in application debugger for microcontrollers'
arch=('any')
url='https://black-magic.org'
license=('GPL')
makedepends=('git' 'hidapi' 'python')
source=("${pkgbase}-${pkgver}::https://github.com/blackmagic-debug/blackmagic/releases/download/v${pkgver}/blackmagic-full-source-v${pkgver//./_}.tar.gz")
sha256sums=('6050a7faef6d91560c10c3c28baf9beb2e79c799d936e477be149bb32a07d71f')

build() {
  cd "blackmagic-full-source-v${pkgver//./_}"

  make PROBE_HOST=hosted ENABLE_RTT=1
}

package_black-magic-debug-udev() {
  conflicts=('black-magic-udev')
  provides=('black-magic-udev')

  cd "blackmagic-full-source-v${pkgver//./_}"

  install -Dm 644 driver/99-blackmagic-uucp.rules "${pkgdir}"/usr/lib/udev/rules.d/99-blackmagic-uucp.rules
}

package_black-magic-debug-app() {
  conflicts=('black-magic-app')
  provides=('black-magic-app')
  depends=('libusb' 'libftdi' 'libhidapi-libusb.so')

  cd "blackmagic-full-source-v${pkgver//./_}"

  install -Dm 755 src/blackmagic "${pkgdir}"/usr/bin/blackmagic
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgbase}" COPYING
}
