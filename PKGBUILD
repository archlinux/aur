# Maintainer: Frederik Holm Strøm <aur@katofln.com>

# https://chatboxapp.xyz/

_pkgname=chatbox
pkgname="${_pkgname}-appimage"
pkgver=0.4.4
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
b2sums=('977cc6cd037b295448c896cf606ac9658e6ad4fbb7737738d280132c445ddf715269fc82c3299b05877a2568f7a6e1ac299e243cb0d0b4ffa30b58c3b3ff664f')

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
