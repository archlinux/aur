# Maintainer: Eugene Hwang <hwang dot eug at gmail dot com>

_pkgname=vysor
pkgname=${_pkgname}-appimage
pkgver=2.2.1
pkgrel=1
pkgdesc="Android screen mirroring tool"
arch=('x86_64')
url="https://vysor.io"
license=('custom')
provides=('vysor')
conflicts=('vysor')
makedepends=('fuse2')
source=("https://github.com/koush/vysor.io/releases/download/continuous/Vysor_${pkgver}.AppImage"
        "vysor.sh")
sha256sums=('b93711e0c4c339645052be6d68bca32914a9531e184c182272b32c1e0d44b4d9'
            '61836b2a07581202010cf40a1862b19bcb3e168076d113c6db06caadddbf0150')
options=(!strip)
_filename=./Vysor_${pkgver}.AppImage

prepare() {
    cd "${srcdir}"
    chmod u+x ${_filename}
    ./${_filename} --appimage-extract 2> /dev/null
}

build() {
    sed -i "s|Exec=.*|Exec=${_pkgname}|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
    install -dm755 "${pkgdir}/opt/appimages"
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.appimage"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/0x0/apps"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png"

    for icon_res in $(ls "${srcdir}/squashfs-root/usr/share/icons/hicolor"); do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/$icon_res/apps"
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/$icon_res/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/$icon_res/apps/${_pkgname}.png";
    done

    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/appimagekit-${_pkgname}.desktop"

    rm -rf "${srcdir}/squashfs-root"
}
