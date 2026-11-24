# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Robin Bühler <r plus aur at obin dot ch>

_pkgname=kmeet
_originalpkgname=kMeet

pkgname="${_pkgname}"-appimage
pkgver=2.1.0
pkgrel=0
pkgdesc="kMeet allows you to organise secure online meetings via your web browser, your mobile, your tablet or your computer."
arch=('x86_64')
url="https://www.infomaniak.com/en/ksuite/kmeet"
license=('custom:Unlicense')
depends=('zlib')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://download.storage.infomaniak.com/meet/kmeet-desktop-${pkgver}-linux-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('5648834baafe9b202ee027c2f515761d5768c6738b4c70b8c6a29282ac99cb7d')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_originalpkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_originalpkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
