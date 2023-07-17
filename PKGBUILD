# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

# code from https://aur.archlinux.org/packages/chatbox-appimage
_pkgname=Chatbox
pkgname="chatbox-bin"
pkgver=0.6.2
pkgrel=1
pkgdesc="Chatbox is a desktop app for GPT-4 / GPT-3.5 (OpenAI API) that supports Windows, Mac & Linux."
arch=('x86_64')
url="https://github.com/Bin-Huang/chatbox"
license=('GPL')
depends=('fuse2fs')
provides=("$pkgname")
conflicts=("${_pkgname}-appimage")
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
source=("${url}/releases/download/v${pkgver}/${_appimage}")
noextract=("$_appimage")
sha512sums=('96a545e65b516df69410cbc987bd900a1b9b39a07c00e5b020dee6367b72c0c93e6f0d48e6c22b8e0fdd45f59144188c0777c5ec7fca6b4d15f626aeae2cda88')

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
