# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Romain "Artefact2" Dal Maso <artefact2@gmail.com>

_pkgbase=v4l2loopback
pkgname=${_pkgbase}-dkms-git
pkgver=0.12.5.r232.g2fa9d6d
pkgrel=1
pkgdesc="v4l2-loopback device"
url="https://github.com/umlaeute/v4l2loopback"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git' 'help2man')
conflicts=("${_pkgbase}-dkms")
provides=("${_pkgbase}-dkms")
source=("git+https://github.com/umlaeute/v4l2loopback.git#branch=main")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgbase}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${_pkgbase}"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
    cp -vf COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install-utils install-man
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
