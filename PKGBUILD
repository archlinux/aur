# Maintainer: Frederik Holm Strøm <aur@frederikstroem.com>

# Chatbox website: https://chatboxapp.xyz/
# Chatbox GitHub: https://github.com/Bin-Huang/chatbox

_pkgname=Chatbox
pkgname="chatbox-appimage"
pkgver=0.6.1
pkgrel=3
pkgdesc="Chatbox is a desktop app for GPT-4 / GPT-3.5 (OpenAI API) that supports Windows, Mac & Linux."
arch=('x86_64')
url="https://github.com/Bin-Huang/chatbox"
license=('GPL')
depends=('fuse2fs')
provides=("$pkgname")
conflicts=("${_pkgname}-bin")
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
source=("${url}/releases/download/v${pkgver}/${_appimage}")
noextract=("$_appimage")
sha512sums=('f2da56a9ecbc40dbb51954c76547e99c390acaab30dd7a9248998e6fa4115b2e0789ad86cb6dac9f90d0e025f27d3b8a592e81ae2214d2f326af61134facbe14')

prepare() {
    chmod +x "$_appimage"
    "./$_appimage" --appimage-extract

    # Fixing the desktop file
    sed -i -E "s:Exec=AppRun:Exec=/opt/${_pkgname}/${_appimage}:" "squashfs-root/xyz.chatboxapp.app.desktop"
}

package() {
    # Appimage and symlink
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/xyz.chatboxapp.app.desktop" "${pkgdir}/usr/share/applications/xyz.chatboxapp.app.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/pixmaps/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/xyz.chatboxapp.app.png" "${pkgdir}/usr/share/pixmaps/xyz.chatboxapp.app.png"
}
