# Maintainer: sakuyma <sakuyma@proton.me>
_pkgname=PolyMC
pkgname=polymc-appimage
pkgver=8.1
pkgrel=1
pkgdesc="Minecraft launcher compatible with MultiMC (AppImage release)"
arch=('x86_64')
url="https://polymc.org/"
license=('GPL3')
depends=('fuse2' 'zlib')
options=(!strip)

_appimage="PolyMC-Linux-amd64-${pkgver}.AppImage"

source=("${_appimage}::https://github.com/PolyMC/PolyMC/releases/download/${pkgver}/${_appimage}")
sha256sums=('1b52b12b2998ecf0b67be15c3d551229200d8bef0bb957b7a4f05b755977d1a4')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/polymc"

    # .desktop
    install -Dm644 "${srcdir}/squashfs-root/org.polymc.PolyMC.desktop" \
        "${pkgdir}/usr/share/applications/org.polymc.PolyMC.desktop"

    sed -i "s|^Exec=.*|Exec=/opt/${pkgname}/${pkgname}.AppImage %U|" \
        "${pkgdir}/usr/share/applications/org.polymc.PolyMC.desktop"

    # иконка
    install -Dm644 "${srcdir}/squashfs-root/org.polymc.PolyMC.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.polymc.PolyMC.svg"
}
