_pkgname=flightgear
_pkgver=2020.3.19
_appimage="FlightGear-${_pkgver}-x86_64.AppImage"
_desktopfile="org.flightgear.FlightGear.desktop"

pkgname=flightgear-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator. Appimage version"
arch=(x86_64)
license=('GPL')
url="http://www.flightgear.org/"
depends=('libxmu' 'libxi' 'zlib' 'openscenegraph' 'libxrandr' 'glu' 'openal')
optdepends=('qt5-base: fgfs --launcher'
            'qt5-declarative: fgfs --launcher'
            'flightgear-data: game data files')
options=(!strip)
source=("${_appimage}::https://sourceforge.net/projects/flightgear/files/release-2020.3/${_appimage}/download")
sha256sums=('0e84088e5ac5de7bed23b1975e80cff3f888c1477e71260615439fe13131cd15')


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

