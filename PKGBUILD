# Maintainer: Frederik Holm Strøm <aur@frederikstroem.com>

# https://chatboxapp.xyz/

_pkgname=chatbox
pkgname="${_pkgname}-appimage"
pkgver=0.4.5
pkgrel=1
pkgdesc="Chatbox is a desktop app for GPT-4 / GPT-3.5 (OpenAI API) that supports Windows, Mac & Linux."
arch=('x86_64')
url="https://github.com/Bin-Huang/chatbox"
license=('GPL')
depends=('fuse2fs')
provides=("$pkgname")
conflicts=("${_pkgname}-bin")
options=(!strip)
_appimage="${_pkgname}.AppImage"
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage")
noextract=("$_appimage")
sha512sums=('8b3415ead8ff83e89c3fbb515d1ede9ebee4c872c7c533b6a75a33ec8b18e1deddf52796774d0cf1a6602383eb9b6128d1c6c708ece8a6fa90164fbcbb531e09')

prepare() {
    mv "${_pkgname}_${pkgver}_amd64.AppImage" "$_appimage"
    chmod +x "$_appimage"
    "./$_appimage" --appimage-extract

    # Fixing the desktop file
    sed -i -E "s:Exec=AppRun:Exec=/opt/${_pkgname}/${_appimage}:" "squashfs-root/${_pkgname}.desktop"
}

package() {
    # Appimage and symlink
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/pixmaps/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/chatbox.png" "${pkgdir}/usr/share/pixmaps/chatbox.png"
}
