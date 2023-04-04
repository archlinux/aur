# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
_pkgname=powerliminalsplayer
pkgname=${_pkgname}-appimage
pkgver=3.1
pkgrel=1
pkgdesc="Plays multiple audios simultaneously at varying speeds"
arch=('x86_64')
url="https://github.com/mysteryx93/NaturalGroundingPlayer/wiki/Powerliminals-Player"
license=('MIT')

options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mysteryx93/NaturalGroundingPlayer/releases/download/v${pkgver}/PowerliminalsPlayer-${pkgver}_Linux_x64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('2a71ab03e53ee7985655446f92f35588eabb86840fddba962197ef3080145d84')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    #install -dm755 "${pkgdir}/usr/share/"
    #cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
