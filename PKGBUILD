# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Romain "Artefact2" Dal Maso <artefact2@gmail.com>

_pkgbase=v4l2loopback
pkgname=${_pkgbase}-dkms-git
pkgver=0.12.3.r6.ge4f2c3c
pkgrel=1
pkgdesc="v4l2-loopback device"
url="https://github.com/umlaeute/v4l2loopback"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('dkms' 'linux-headers')
makedepends=('git' 'help2man')
conflicts=("${_pkgbase}-dkms")
provides=("${_pkgbase}-dkms")
install="${pkgname}.install"
source=("git://github.com/umlaeute/v4l2loopback.git"
        "${pkgname}.install")
md5sums=('SKIP'
         '3105b604a5ebe4af6df587049ed19946')

pkgver() {
    cd "$srcdir/${_pkgbase}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_pkgbase}"
    make
}

package() {
    cd "${srcdir}/${_pkgbase}"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
    cp -vf COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install-utils install-man
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cd "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    make clean
}

# vim:set ts=4 sw=4 et:
