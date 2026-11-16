# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgbase='black-magic-debug'
pkgname=(black-magic-debug-app black-magic-debug-udev)
pkgver=2.1.0
pkgrel=1
pkgdesc='In-application debugger for ARM Cortex and RISC-V processors'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://black-magic.org'
license=('GPL-3.0-or-later' 'BSD-3-Clause' 'MIT')
makedepends=('git' 'meson' 'python' 'hidapi' 'libftdi' 'libusb')
source=("blackmagic-${pkgver}.tar.gz::https://codeberg.org/blackmagic-debug/blackmagic/archive/v${pkgver}.tar.gz")
sha256sums=('704c070e636a5eac21d784da8704c2fd10a436ac0069ce585b90834c4c2395b9')

prepare() {
  meson subprojects download --sourcedir=blackmagic
}

build() {
  arch-meson blackmagic build -Denable_gpiod=disabled
  meson compile -C build
}

package_black-magic-debug-udev() {
  arch=('any')
  conflicts=('black-magic-udev' 'black-magic-debug-udev')
  provides=('black-magic-debug-udev')

  install -Dm 644 "blackmagic/driver/99-blackmagic-uucp.rules" "${pkgdir}/usr/lib/udev/rules.d/99-blackmagic-uucp.rules"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" blackmagic/COPYING*
}

package_black-magic-debug-app() {
  conflicts=('black-magic-debug-app')
  provides=('black-magic-debug-app')
  depends=('glibc' 'libusb' 'libftdi' 'hidapi')

  install -Dm 755 build/blackmagic "${pkgdir}/usr/bin/blackmagic"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" blackmagic/COPYING*
}
