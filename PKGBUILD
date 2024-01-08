# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
AppName=PowerliminalsPlayer
appid=powerliminalsplayer
pkgname=${appid}-appimage
pkgver=3.3
pkgrel=3
pkgdesc="Plays multiple audios simultaneously at varying speeds"
arch=('x86_64')
url="https://github.com/mysteryx93/NaturalGroundingPlayer/wiki/Powerliminals-Player"
license=('MIT')

options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mysteryx93/HanumanInstituteApps/releases/download/v${pkgver}/${AppName}-${pkgver}_Linux_x64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('888e5e0c77f1b8d6323c01b623858944366de11f8b6bba46a650673e578a78f6')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    sed -i "s/\/${AppName}/\/${appid}/g" "${srcdir}/squashfs-root/${appid}.desktop"
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${appid} %u|"\
        "squashfs-root/${appid}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${appid}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${appid}.desktop"\
            "${pkgdir}/usr/share/applications/${appid}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${appid}.AppImage" "${pkgdir}/usr/bin/${appid}"
}
