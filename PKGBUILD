# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgbase='black-magic-debug'
pkgbase="${_pkgbase}-git"
pkgname=(black-magic-debug-app-git black-magic-debug-udev-git)
pkgver=1.9.0.r662.gcfbeeb50
pkgrel=1
pkgdesc='Plug&Play in application debugger for microcontrollers'
arch=('any')
url='https://black-magic.org'
license=('GPL' 'BSD' 'MIT')
makedepends=('git' 'hidapi' 'python')
source=("git+https://github.com/blackmagic-debug/blackmagic.git")
sha256sums=('SKIP')

pkgver() {
    cd "blackmagic"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "blackmagic"

    make PROBE_HOST=hosted ENABLE_RTT=1
}

package_black-magic-debug-udev-git() {
	conflicts=('black-magic-debug-udev')
	provides=('black-magic-debug-udev')

    cd "blackmagic"

    install -Dm 644 driver/99-blackmagic-uucp.rules "${pkgdir}"/usr/lib/udev/rules.d/99-blackmagic-uucp.rules
}

package_black-magic-debug-app-git() {
	conflicts=('black-magic-debug-app')
	provides=('black-magic-debug-app')
    depends=('libusb' 'libftdi' 'libhidapi-libusb.so')

    cd "blackmagic"

    install -Dm 755 src/blackmagic "${pkgdir}"/usr/bin/blackmagic
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgbase}" COPYING*
}
