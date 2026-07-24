# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Robin Bühler <r plus aur at obin dot ch>

_pkgname=kchat
_originalpkgname=kChat

pkgname="${_pkgname}"-appimage
pkgver=3.3.5
pkgrel=1
pkgdesc="kChat is an instant messaging service which enables you to discuss, share and coordinate your teams in complete security via your Internet browser, mobile phone, tablet or computer."
arch=('x86_64')
url="https://www.infomaniak.com/en/apps/download-kchat"
license=('custom:Unlicense')
depends=('zlib')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://download.storage5.infomaniak.com/kchat/kchat-desktop-${pkgver}-linux-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('2f08975fd078a6ba9283771c2974f787fe43e646b0ac5ec45edf3a0f9900d107')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}-desktop.desktop"
    # Fix icon name in .desktop file
    sed -i "s|Icon=.*|Icon=${_pkgname}-desktop|"\
        "squashfs-root/${_pkgname}-desktop.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}-desktop.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images - manually install to 512x512 folder for proper GNOME recognition
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    for icon in "${srcdir}/squashfs-root/usr/share/icons"/*/*/apps/*; do
        [ -f "$icon" ] && install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}-desktop.${icon##*.}"
    done

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
