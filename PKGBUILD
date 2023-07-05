_pkgname=flightgear
_pkgver=2020.3.18
_appimage="FlightGear-${_pkgver}-x86_64.AppImage"
_desktopfile="org.flightgear.FlightGear.desktop"

pkgname=flightgear-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator. Appimage version"
arch=(x86_64)
license=('GPL')
url="http://www.flightgear.org/"
depends=()
options=(!strip)
source=("${_appimage}::https://sourceforge.net/projects/flightgear/files/release-2020.3/${_appimage}/download")
sha256sums=('1598b59ffd0213963e623b559100eecb89e03b058d1e30ff353a86799baefb54')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_desktopfile}
    ./${_appimage} --appimage-extract ${_pkgname}.png
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/fgfs" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

