# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Robin Bühler <r plus aur at obin dot ch>

_pkgname=kdrive
_originalpkgname=kDrive

pkgname="${_pkgname}"-appimage
pkgver=3.8.2.6
pkgrel=1
pkgdesc="kDrive allows you to collaborate, store and share your data securely via your web browser, your mobile, your tablet or your computer."
arch=('x86_64' 'aarch64')
url="https://www.infomaniak.com/en/apps/download-kdrive"
license=('custom:Unlicense')
depends=('zlib')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://download.storage.infomaniak.com/drive/desktopclient/kDrive-${pkgver}-amd64.AppImage")
source_aarch64=("${_appimage}::https://download.storage.infomaniak.com/drive/desktopclient/kDrive-${pkgver}-arm64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('b286fa8d2b6f487ba747a6e68b194709a43c8267723ddf2506cca0e68d3f6291')
sha256sums_aarch64=('b286fa8d2b6f487ba747a6e68b194709a43c8267723ddf2506cca0e68d3f6291')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=kDrive|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_originalpkgname}_client.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_originalpkgname}_client.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
