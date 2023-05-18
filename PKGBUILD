# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=tokentool
_pkgname=TokenTool
pkgver=2.2.1
pkgrel=2
pkgdesc="A free tool written in Java for building digital avatars, focussed around Virtual Tabletops."
arch=('x86_64')
url="https://rptools.net/toolbox/token-tool"
license=('AGPL3')
makedepends=('git' 'gradle' 'dpkg' 'jdk10')
provides=('tokentool')
conflicts=('tokentool')
source=("git+https://github.com/RPTools/tokentool.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {

    ORIG_JAVA="$(archlinux-java get)"
    sudo archlinux-java set java-10-jdk

    cd ${pkgname}
    gradle deploy

    if [ -n "$ORIG_JAVA" ]; then
        sudo archlinux-java set $ORIG_JAVA
    else
        sudo archlinux-java unset
    fi
}

package() {

    cd "${srcdir}/${pkgname}/releases/release-${pkgver}"
    ar vx "${pkgname}-${pkgver}.deb"
    tar -C "${pkgdir}" -xf data.tar.xz

    install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
