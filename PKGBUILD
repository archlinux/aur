# Maintainer: Frederik Holm Strøm <aur@frederikstroem.com>

# Chatbox website: https://chatboxai.app/
# Chatbox GitHub: https://github.com/Bin-Huang/chatbox

_pkgname=Chatbox
pkgname="chatbox-appimage"
pkgver=1.5.1
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
sha512sums=('f07d7872026d634610fd548a325d2d59b1d87ff7520a06384fd694197b5f4923f7faaea726161e0e379fc76722dab8b45943913ddf134d4ba20cc0e942e019f8')

prepare() {
    # Make the AppImage executable
    chmod +x "$_appimage"

    # Extract the AppImage
    "./$_appimage" --appimage-extract

    # Update the Exec line in the desktop entry file
    sed -i -E "s:Exec=AppRun:Exec=/opt/${_pkgname}/${_appimage}:" "squashfs-root/${_pkgid}.desktop"
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
