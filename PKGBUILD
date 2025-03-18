# Maintainer: redponike <proton (dot) me>
# Contributor: Frederik Holm Strøm <aur@frederikstroem.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

_pkgname=Chatbox
pkgname="chatbox-bin"
pkgver=1.10.7
pkgrel=1
pkgdesc="User-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, Ollama...)"
arch=('x86_64')
url="https://chatboxai.app"
license=('custom')
depends=('fuse2')
provides=("$pkgname")
conflicts=("chatbox-appimage" "chatbox-git")
options=(!strip)
_appimage="${_pkgname}-${pkgver}-${arch}.AppImage"
_pkgid="xyz.chatboxapp.app"
source=("https://download.chatboxai.app/releases/${_appimage}")
noextract=("$_appimage")
sha512sums=('bc5a3015775badb698956fb29d23fc02cffbad664a17d3edbd069d1448383c3c921aa0137ba77c1fc97de93d0ff0d98c81ce68dbade6e3760ec95fadd83cebe9')

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

    # License not provided by upstream - The developer was contacted / awaiting response
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
