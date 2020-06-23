# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=beagle-logic-dkms-git
pkgver=r216.c52845a
pkgrel=1
pkgdesc='A logic analyzer for the PRUs on the BeagleBone / BeagleBone Black'
arch=('armv7h')
url='http://www.beaglelogic.net'
license=('GPL3')
depends=('dkms' 'beagle-logic-firmware')
makedepends=('git')
provides=('beagle-logic-firmware')

source=(
    'beagle-logic::git+https://github.com/gpollo/BeagleLogic#branch=update-kernel'
    'Makefile'
    'dkms.conf'
)

md5sums=(
    'SKIP'
    '712700704d517c7310f86823e28a31b7'
    '22169a1c11b8e2b4787d8274c02641e9'
)

pkgver() {
    cd "${srcdir}/beagle-logic"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/beagle-logic/kernel"

    make beaglelogic-00A0.dtbo
}

package() {
    mkdir -p "${pkgdir}/usr/src/beaglelogic-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/firmware"

    cd "${srcdir}"
    install -Dm644 "Makefile" "${pkgdir}/usr/src/beaglelogic-${pkgver}/Makefile"
    install -Dm644 "dkms.conf" "${pkgdir}/usr/src/beaglelogic-${pkgver}/dkms.conf"
    sed -i "s/@PKGVER@/${pkgver}/g" "${pkgdir}/usr/src/beaglelogic-${pkgver}/dkms.conf"

    cd "${srcdir}/beagle-logic/kernel"
    install -Dm644 "beaglelogic.c" "${pkgdir}/usr/src/beaglelogic-${pkgver}/beaglelogic.c"
    install -Dm644 "beaglelogic.h" "${pkgdir}/usr/src/beaglelogic-${pkgver}/beaglelogic.h"
    install -Dm644 "beaglelogic-00A0.dtbo" "${pkgdir}/usr/lib/firmware/beaglelogic-00A0.dtbo"
}
