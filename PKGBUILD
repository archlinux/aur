# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_pkgbase=akvcam
pkgname=${_pkgbase}-dkms-git
pkgver=1.0.3.r0.g931473c
pkgrel=1
pkgdesc="Virtual camera for Linux"
url="https://github.com/webcamoid/akvcam"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('dkms' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}-dkms")
provides=("${_pkgbase}-dkms")
install="${pkgname}.install"
source=("git://github.com/webcamoid/akvcam.git"
        "${pkgname}.install")
md5sums=('SKIP'
         '3e315711dc9e57c9ba963abea81468b1')

pkgver() {
    cd "$srcdir/${_pkgbase}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_pkgbase}/src"
    make
}

package() {
    cd "${srcdir}/${_pkgbase}"
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -vf COPYING "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
    cp -vf COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}"
    mkdir -p "${pkgdir}/etc/${_pkgbase}"
    cp -vf share/config_example.ini "${pkgdir}/etc/${_pkgbase}"
    cd "${srcdir}/${_pkgbase}/src"
    cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cd "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    make clean
}
