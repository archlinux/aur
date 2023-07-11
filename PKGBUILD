_pkgname=augustus
_pkgver=3.2.0
_appimage="${_pkgname}-${_pkgver}-linux.AppImage"
_desktopfile="com.github.keriew.augustus"

pkgname=augustus-game-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required). Appimage version"
arch=(x86_64)
license=(AGPL)
url="https://github.com/Keriew/augustus"
depends=('fuse2')
conflicts=('augustus-game' 'augustus-game-git')
options=(!strip)
source=("https://github.com/Keriew/augustus/releases/download/v${pkgver}/${_appimage}")
sha256sums=('e973adfc01db2dd03637dd22f6b3ecc578a604bf4e761582d6f6eb243f995be0')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_desktopfile}.desktop
    ./${_appimage} --appimage-extract usr/share/icons/hicolor/512x512/apps/${_desktopfile}.png
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}.desktop" "${pkgdir}/usr/share/applications"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_desktopfile}.png" "${pkgdir}/usr/share/pixmaps"
}

