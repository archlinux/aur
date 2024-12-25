# Maintainer: redponike <proton (dot) me>
# Contributor: Frederik Holm Strøm <aur@frederikstroem.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

_pkgname=Chatbox
pkgname="chatbox-bin"
pkgver=1.8.1
pkgrel=1
pkgdesc="User-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, Ollama...)"
arch=('x86_64')
url="https://chatboxai.app"
license=('GPL-3.0')
depends=('fuse2')
provides=("$pkgname")
conflicts=("chatbox-appimage" "chatbox-git")
options=(!strip)
_appimage="${_pkgname}-${pkgver}-${arch}.AppImage"
_pkgid="xyz.chatboxapp.app"
source=("https://download.chatboxai.app/releases/${_appimage}")
noextract=("$_appimage")
sha512sums=('a8537f6d803d9d2035fdc7ae53c2b318185af4cb7ba64901a1d4a8cf70339143641fb34c90719a6fa96ef1bf24cb949cc6968dd38c87b315ce5bc07862346ae2')

prepare() {
    # Make the AppImage executable
    chmod +x "$_appimage"

    # Extract the AppImage
    "./$_appimage" --appimage-extract

    # Update the Exec line in the desktop entry file
    sed -i -E "s:Exec=.*:Exec=/opt/${_pkgname}/${_appimage}:" "squashfs-root/${_pkgid}.desktop"
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
