# Maintainer: Yuri Karamian <yuri@arkhost.com>
pkgname=helixnotes-appimage-bin
_pkgname=HelixNotes
pkgver=1.3.3
pkgrel=1
pkgdesc="Local markdown note-taking app built with Rust, Tauri, and SvelteKit"
arch=('x86_64')
url="https://helixnotes.com"
license=('AGPL-3.0-only')
depends=('fuse2' 'gtk3')
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.AppImage::https://download.helixnotes.com/releases/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage"
        "helixnotes.desktop")
sha256sums=('b4634e172f7a3b6f61bc57264381dd75697b90cb099ecd60f2db26cea1f8bbff'
            '48f71a140951aa15b99defae687ee8e9462de44847fdf961dfafa1c2ef519856')
noextract=("${_pkgname}_${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${_pkgname}_${pkgver}_amd64.AppImage"
    ./"${_pkgname}_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}_${pkgver}_amd64.AppImage" \
        "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # Extract icon from squashfs-root if available
    if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/"*.png ]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/"*.png \
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
