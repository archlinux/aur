# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgbase='black-magic-debug'
pkgbase="${_pkgbase}-git"
pkgname=(black-magic-debug-app-git black-magic-debug-udev-git)
pkgver=1.9.0.rc1.r33.g302c8b53
pkgrel=2
pkgdesc='Plug&Play in application debugger for microcontrollers'
arch=('any')
url='https://black-magic.org'
license=('GPL' 'BSD' 'MIT')
makedepends=('git' 'hidapi' 'python')
options=(!strip)
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
    cd "blackmagic"

    install -Dm 644 driver/99-blackmagic-uucp.rules "${pkgdir}"/usr/lib/udev/rules.d/99-blackmagic-uucp.rules
}

package_black-magic-debug-app-git() {
    cd "blackmagic"

    depends=('libusb' 'libftdi' 'libhidapi-libusb.so')

    install -Dm 755 src/blackmagic "${pkgdir}"/usr/bin/blackmagic
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgbase}" COPYING*
}
