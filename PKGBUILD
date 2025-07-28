# Maintainer: Josh Ellithorpe <quest at mac dot com>

_pkgname=Chatbox
pkgname="chatbox-appimage"
pkgver=1.15.2
pkgrel=2
pkgdesc="User-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, Ollama...)"
arch=('x86_64')
url="https://chatboxai.app"
license=('GPL-3.0')
depends=('fuse2')
provides=("$pkgname")
conflicts=("chatbox-bin" "chatbox-git")
options=(!strip)
_appimage="${_pkgname}-${pkgver}-${arch}.AppImage"
_pkgid="xyz.chatboxapp.app"
source=("https://download.chatboxai.app/releases/${_appimage}")
noextract=("$_appimage")
sha512sums=('2995d5b9e6482faf8f05afaa905a337fc9332f39ffe0ede166ca0fffc6e33d212f41ab331f30e013de7df1c6d85f8ba17539162750ea4c9f14767f435827ccbe')

prepare() {
    # Make the AppImage executable
    chmod +x "$_appimage"

    # Extract the AppImage
    "./$_appimage" --appimage-extract

    # Update the Exec line in the desktop entry file and fix the icon.
    sed -i -E "s:Exec=AppRun:Exec=/opt/${_pkgname}/${_appimage}:" "squashfs-root/${_pkgid}.desktop"
    sed -i -E "s:StartupWMClass=Chatbox:StartupWMClass=${_pkgid}:" "squashfs-root/${_pkgid}.desktop"
}

package() {
    # Install the AppImage and create a symlink
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install the desktop entry file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgid}.desktop" "${pkgdir}/usr/share/applications/${_pkgid}.desktop"

    # Install the icon
    install -dm755 "${pkgdir}/usr/share/pixmaps/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/${_pkgid}.png" "${pkgdir}/usr/share/pixmaps/${_pkgid}.png"
}
