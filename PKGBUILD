# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgbase='black-magic-debug'
pkgname=(black-magic-debug-app black-magic-debug-udev)
pkgver=1.8.2
pkgrel=1
pkgdesc='Plug&Play in application debugger for microcontrollers'
arch=('any')
url='https://black-magic.org'
license=('GPL')
makedepends=('git' 'hidapi' 'python')
source=("${pkgbase}-${pkgver}::https://github.com/blackmagic-debug/blackmagic/releases/download/v${pkgver}/blackmagic-full-source-v${pkgver//./_}.tar.gz")
sha256sums=('24ffe59fd4db220ab4e35ae6fd1d3f99b09c96c764c2440b174f98f771653219')

build() {
  cd "blackmagic-full-source-v${pkgver//./_}"

  make PROBE_HOST=hosted ENABLE_RTT=1
}

package_black-magic-debug-udev() {
	conflicts=('black-magic-udev')
	provides=('black-magic-udev')

    cd "blackmagic-full-source-v${pkgver//./_}"

    install -Dm 644 driver/99-blackmagic.rules "${pkgdir}"/usr/lib/udev/rules.d/99-blackmagic.rules
}

package_black-magic-debug-app() {
	conflicts=('black-magic-app')
	provides=('black-magic-app')
    depends=('libusb' 'libftdi' 'libhidapi-libusb.so')

    cd "blackmagic-full-source-v${pkgver//./_}"

    install -Dm 755 src/blackmagic "${pkgdir}"/usr/bin/blackmagic
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgbase}" COPYING
}
