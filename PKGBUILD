# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgbase='black-magic-debug'
pkgname=(black-magic-debug-app black-magic-debug-udev)
pkgver=2.0.0
pkgrel=1
pkgdesc='In-application debugger for ARM Cortex and RISC-V processors'
arch=('any')
url='https://black-magic.org'
license=('GPL' 'BSD' 'MIT')
makedepends=('git' 'hidapi' 'python')
source=("https://github.com/blackmagic-debug/blackmagic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('81ba56b002bb4f10e65bcd2adc8a4da3cd17af5bdd5964130c67eaa2d3d530c0')

prepare() {
  meson subprojects download --sourcedir="blackmagic-${pkgver}"
}

build() {
  arch-meson "blackmagic-${pkgver}" build -Denable_gpiod=disabled
  meson compile -C build
}

package_black-magic-debug-udev() {
  conflicts=('black-magic-udev' 'black-magic-debug-udev')
  provides=('black-magic-debug-udev')

  install -Dm 644 "blackmagic-${pkgver}/driver/99-blackmagic-uucp.rules" "${pkgdir}/usr/lib/udev/rules.d/99-blackmagic-uucp.rules"
}

package_black-magic-debug-app() {
  conflicts=('black-magic-debug-app')
  provides=('black-magic-debug-app')
  depends=('libusb' 'libftdi' 'libhidapi-libusb.so')

  install -Dm 755 build/blackmagic "${pkgdir}/usr/bin/blackmagic"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgbase}" "blackmagic-${pkgver}"/COPYING*
}
