# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=beagle-logic-firmware-git
pkgver=r216.c52845a
pkgrel=1
pkgdesc='A logic analyzer for the PRUs on the BeagleBone / BeagleBone Black'
arch=('armv7h')
url='http://www.beaglelogic.net'
license=('custom')
makedepends=('git' 'cmake' 'ti-pru-cgt' 'ti-pru-swpkg')
provides=('beagle-logic-firmware')

source=('beagle-logic::git+https://github.com/gpollo/BeagleLogic#branch=cmake')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/beagle-logic"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "${srcdir}/beagle-logic/firmware/build"
    cd "${srcdir}/beagle-logic/firmware/build"

    unset CFLAGS
    unset LDFLAGS

    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    mkdir -p "${pkgdir}/lib/firmware/"
    cd "${srcdir}/beagle-logic/firmware/build"

    install -Dm644 "beaglelogic-pru0" "${pkgdir}/lib/firmware/beaglelogic-pru0-fw"
    install -Dm644 "beaglelogic-pru1" "${pkgdir}/lib/firmware/beaglelogic-pru1-fw"
}
