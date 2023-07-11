_pkgname=openhv
_pkgver=20230416
_appimage="OpenHV-${_pkgver}-x86_64.AppImage"
_desktopfile="openhv"

pkgname=openhv-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="An open-source pixel-art science-fiction real-time-strategy game. Appimage version"
arch=(x86_64)
license=(GPL3)
url="https://www.openhv.net/"
depends=('fuse2')
conflicts=('openhv')
options=(!strip)
source=("https://github.com/OpenHV/OpenHV/releases/download/${_pkgver}/${_appimage}")
sha256sums=('473935f8d2a85e23b0692d81586da498bc407ae85eef19979b1876e1e4c86c1a')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_desktopfile}.desktop
    ./${_appimage} --appimage-extract ${_desktopfile}.png
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
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}.png" "${pkgdir}/usr/share/pixmaps"
}

