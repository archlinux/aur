_pkgname=linux-air-combat
_pkgver=915
_appimage="Lac${_pkgver}-x86_64.AppImage"
_desktopfile="lac"

pkgname=linux-air-combat-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Free open source combat flight simulator. Appimage version"
arch=(x86_64)
license=(unknown)
url="https://sourceforge.net/projects/linuxaircombat"
depends=('fuse2' 'freeglut' 'sdl' 'sdl_mixer' 'glu' 'mesa')
conflicts=('linux-air-combat')
options=(!strip)
source=("${_appimage}::https://sourceforge.net/projects/linuxaircombat/files/Choose%20Your%20Platform/Precompiled%20binaries%20%28no%20source%20code%29/${_appimage}/download")
sha256sums=('467381ae51a305224f3138ce583194e442db80cf2b674347b3833af7af1e3c0a')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract usr/share/applications/${_desktopfile}.desktop
    ./${_appimage} --appimage-extract usr/share/icons/hicolor/64x64/apps/${_desktopfile}.png
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/lac" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_desktopfile}.desktop" "${pkgdir}/usr/share/applications/${_desktopfile}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/64x64/apps/${_desktopfile}.png" "${pkgdir}/usr/share/pixmaps/${_desktopfile}.png"
}

