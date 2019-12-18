# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool
_pkgname=MapTool
pkgver=1.5.8
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
makedepends=('git' 'gradle' 'dpkg' 'jdk10')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("git+https://github.com/RPTools/maptool.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {

    ORIG_JAVA="$(archlinux-java get)"
    sudo archlinux-java set java-10-jdk

    cd ${pkgname}
    ./gradlew deploy

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

    install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
