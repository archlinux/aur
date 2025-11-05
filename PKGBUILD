# Maintainer: gugah <gugaboy at rocketmail dot com>
# Contributor: Mr.Smith1974

_pkgname=flightgear
_pkgver=2024.1.3
_appimage="FlightGear-${_pkgver}-x86_64.AppImage"
_desktopfile="org.flightgear.FlightGear.desktop"

pkgname=flightgear-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator. AppImage release."
arch=(x86_64)
license=('GPL')
url="http://www.flightgear.org/"
depends=('libxmu' 'libxi' 'zlib' 'libxrandr' 'glu' 'openal' 'fuse2')
optdepends=('qt5-base: fgfs --launcher'
            'qt5-declarative: fgfs --launcher'
            'flightgear-data: game data files')
options=(!strip)
source=("${_appimage}::https://gitlab.com/flightgear/fgmeta/-/releases/${_pkgver}/downloads/flightgear-${_pkgver}-linux-amd64.AppImage")
sha256sums=('6248aa9e5c1f25ba949bde1c6bf0cffb6454b1744e2e44fa297396dc554ff9bf')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_desktopfile}
    ./${_appimage} --appimage-extract usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/fgfs" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
