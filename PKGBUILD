# Maintainer: gugah <gugaboy at rocketmail dot com>
# Contributor: Mr.Smith1974

_pkgname=flightgear
_pkgver=2024.1.1
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
source=("${_appimage}::https://gitlab.com/flightgear/fgmeta/-/jobs/9261456028/artifacts/raw/${_appimage}")
sha256sums=('1e9eb4a6269e564a04471eacfc0be66079eab5f5bb325ff79d2a3b29dfeef621')


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
