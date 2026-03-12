# Maintainer: Yuri Karamian <yuri@arkhost.com>
pkgname=helixnotes-appimage-bin
_pkgname=HelixNotes
pkgver=1.2.5
pkgrel=1
pkgdesc="Local markdown note-taking app built with Rust, Tauri, and SvelteKit"
arch=('x86_64')
url="https://helixnotes.com"
license=('AGPL-3.0-only')
depends=('fuse2' 'gtk3')
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.AppImage::https://download.helixnotes.com/releases/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage"
        "helixnotes.desktop")
sha256sums=('2b7303b38ecf3be8d0b13ca848d235aac1f1caf1302f7055b42dc64e43b647a5'
            '20dd14203d5bedca52933bd60065d013418bcba00cea6dfcec78b292b82900ba')
noextract=("${_pkgname}_${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${_pkgname}_${pkgver}_amd64.AppImage"
    ./"${_pkgname}_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}_${pkgver}_amd64.AppImage" \
        "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # Extract icon from squashfs-root if available
    if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/"*.png ]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/"*.png \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/helixnotes.png"
    elif [ -f "${srcdir}/squashfs-root/"*.png ]; then
        install -Dm644 "${srcdir}/squashfs-root/"*.png \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/helixnotes.png"
    fi

    install -Dm644 "${srcdir}/helixnotes.desktop" \
        "${pkgdir}/usr/share/applications/helixnotes.desktop"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/helixnotes"
}
