# Maintainer: Frederik Holm Strøm <aur@frederikstroem.com>

# Chatbox website: https://chatboxapp.xyz/
# Chatbox GitHub: https://github.com/Bin-Huang/chatbox

_pkgname=chatbox
pkgname="${_pkgname}-appimage"
pkgver=0.5.2
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
sha512sums=('cbd5accc80133ced9980d499b9f822915ef1a38a0cac0847c80add8874a3279cedb1f408e6445fbf0637837089bdacd359df2818bebb3014dee7962d0102e28f')

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
