# Maintainer: Frederik Holm Strøm <aur@frederikstroem.com>

# Chatbox website: https://chatboxapp.xyz/
# Chatbox GitHub: https://github.com/Bin-Huang/chatbox

_pkgname=Chatbox
pkgname="chatbox-appimage"
pkgver=0.6.3
pkgrel=1
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
sha512sums=('756e6ca918591e1c49bd4fcfdd8d402bb0fe307c29504d3f074ff529daf8f15dd181bc1d69590a83cd922aca1670755b995dc29698fd17af76b90c3f926e6f02')

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
