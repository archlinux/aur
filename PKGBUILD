# Maintainer: Frederik Holm Strøm <frederikstroem@pm.me>

# Thanks to AUR users: Trebuchette, tobtoht

_pkgname=feather
pkgname="monero-${_pkgname}-bin"
pkgver=2.1.2
pkgrel=1
pkgdesc="A free Monero desktop wallet"
arch=('x86_64')
url="https://featherwallet.org"
license=('GPL')
depends=('tor' 'fuse2fs')
provides=("$pkgname")
conflicts=("monero-${_pkgname}" "monero-${_pkgname}-git")
options=(!strip)
_appimage="${_pkgname}.AppImage"
validpgpkeys=('8185E158A33330C7FD61BC0D1F76E155CEFBA71C')
source=("${url}/files/releases/linux-appimage/${_pkgname}-${pkgver}.AppImage"{,.asc})
noextract=("$_appimage")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    mv "${_pkgname}-${pkgver}.AppImage" "$_appimage"
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
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/feather.png" "${pkgdir}/usr/share/pixmaps/feather.png"
}
