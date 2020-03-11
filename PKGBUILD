# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-beta
_pkgname=maptool
_PkgName=MapTool
pkgver=1.6.0
_pkgver=${pkgver}-beta-1
pkgrel=1
pkgdesc="An open source virtual tabletop program, 1.6 beta release"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
makedepends=('git' 'dpkg' 'jdk10')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("git+https://github.com/RPTools/maptool.git#tag=${_pkgver}")
sha256sums=('SKIP')

build() {

    ORIG_JAVA="$(archlinux-java get)"
    sudo archlinux-java set java-10-jdk

    cd ${_pkgname}
    ./gradlew deploy

    if [ -n "$ORIG_JAVA" ]; then
        sudo archlinux-java set $ORIG_JAVA
    else
        sudo archlinux-java unset
    fi
}

package() {

    cd "${srcdir}/${_pkgname}/releases/release-${_pkgver}"
    ar vx "${_pkgname}-${_pkgver}.deb"
    tar -C "${pkgdir}" -xf data.tar.xz

    install -Dm644 "${pkgdir}/opt/${_PkgName}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${pkgdir}/opt/${_PkgName}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${pkgdir}/opt/${_PkgName}/${_PkgName}.desktop" -t "${pkgdir}/usr/share/applications/"
}
