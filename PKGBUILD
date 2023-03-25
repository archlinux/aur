# Maintainer: Markus Jochim <contact-markus@mensing-jochim.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Author: Dominic Radermacher <dominic@familie-radermacher.ch>

_pkgname='ptouch-print'
pkgname="${_pkgname}-git"
pkgver=1.5.r10.g01d6614
pkgrel=1
pkgdesc="Command line tool to print text or graphic labels on Brother P-touch printers like PT-2430PC"
arch=('x86_64' 'i686' 'armv7h' 'armv6h')
url="https://dominic.familie-radermacher.ch/projekte/ptouch-print/"
license=('GPL3')
makedepends=('cmake' 'git')
depends=('libusb>=1.0' 'gd>=2.0.16')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://git.familie-radermacher.ch/linux/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    (   set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p build && cmake --fresh -B build && cmake --build build
}
package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "README"
}
