# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgbase='black-magic-debug'
pkgbase="${_pkgbase}-git"
pkgname=(black-magic-debug-app-git black-magic-debug-udev-git)
pkgver=2.0.0.r43.gefce8f5a
pkgrel=2
pkgdesc='In-application debugger for ARM Cortex and RISC-V processors'
arch=('any')
url='https://black-magic.org'
license=('GPL' 'BSD' 'MIT')
makedepends=('git' 'hidapi' 'python')
source=("git+https://github.com/blackmagic-debug/blackmagic.git")
sha256sums=('SKIP')

pkgver() {
  cd blackmagic
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  meson subprojects download --sourcedir=blackmagic
}

build() {
  arch-meson blackmagic build -Denable_gpiod=disabled
  meson compile -C build
}

package_black-magic-debug-udev-git() {
  conflicts=('black-magic-udev' 'black-magic-debug-udev')
  provides=('black-magic-debug-udev')

  install -Dm 644 blackmagic/driver/99-blackmagic-uucp.rules "${pkgdir}/usr/lib/udev/rules.d/99-blackmagic-uucp.rules"
}

package_black-magic-debug-app-git() {
  conflicts=('black-magic-debug-app')
  provides=('black-magic-debug-app')
  depends=('libusb' 'libftdi' 'libhidapi-libusb.so')

  install -Dm 755 build/blackmagic "${pkgdir}/usr/bin/blackmagic"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgbase}" blackmagic/COPYING*
}
