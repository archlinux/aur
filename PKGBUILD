_pkgname=flare
_pkgver=1.14
_appimage="${_pkgname}-linux64-v${_pkgver}.AppImage"
_desktopfile="${_pkgname}.desktop"

pkgname=flare-game-appimage
pkgver="${_pkgver}"
pkgrel=2
pkgdesc="Fantasy action RPG using the FLARE engine. Appimage version"
arch=(x86_64)
license=(GPL3 CCPL:cc-by-sa-3.0)
url="https://www.flarerpg.org/"
depends=('fuse2')
conflicts=('flare-game-git' 'flare-game' 'flare-engine-git' 'flare-engine')
options=(!strip)
source=("https://github.com/flareteam/flare-game/releases/download/v${pkgver}/${_appimage}")
sha256sums=('b223fa83937db2961939c79ef53552756ade4f4461877e57b2d53f10e79ebfac')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_desktopfile}
    ./${_appimage} --appimage-extract ${_pkgname}.svg
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

