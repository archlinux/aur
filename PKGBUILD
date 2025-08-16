# Contributor: redponike <proton (dot) me>
# Contributor: Frederik Holm Strøm <aur@frederikstroem.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
# Contributor: Ricardo Madriz <richin13 at gmail dot com>

_pkgname=Chatbox
pkgname="chatbox-bin"
pkgver=1.15.3
pkgrel=1
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
sha512sums=('4becb6e1720e5a410119388e4d34cb7eabe28f198d272a6fc8cf53d27688df0dab607d2f1784f913a48f18cd9cd3da8e188074afb26de76be23ba21e018ab63e')

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
