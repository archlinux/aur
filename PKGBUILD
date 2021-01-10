# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_pkgbase=akvcam
pkgname=${_pkgbase}-dkms-git
pkgver=1.2.0.r0.g435ac0f
pkgrel=1
pkgdesc="Virtual camera for Linux"
url="https://github.com/webcamoid/akvcam"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}-dkms")
provides=("${_pkgbase}-dkms")
source=("git://github.com/webcamoid/akvcam.git")
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
    cd "${srcdir}/${_pkgbase}/src"

    make install INSTALLDIR="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -vf "${srcdir}/${_pkgbase}/COPYING" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
    cp -vf "${srcdir}/${_pkgbase}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgbase}"
    mkdir -p "${pkgdir}/etc/${_pkgbase}/examples"
    cp -vf "${srcdir}/${_pkgbase}/share/config_example.ini" "${pkgdir}/etc/${_pkgbase}"
    cp -vf "${srcdir}/${_pkgbase}/share/examples/output.c" "${pkgdir}/etc/${_pkgbase}/examples"
}
