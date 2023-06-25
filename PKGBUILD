# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="metronome-appimage"
pkgver=0.1.6
pkgrel=1
pkgdesc="A metronome built w/ Tauri + React. Tempo tapper, themes, hotkeys and more!"
arch=("x86_64")
url="https://zane.pw/metronome"
_githuburl="https://github.com/ZaneH/metronome"
license=("unknown")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/app-v${pkgver}/${pkgname%-appimage}_${pkgver}_amd64.AppImage")
sha256sums=('8180341445fbd9770946cdc0b59e2ed644e2fd5cd490a3a475e96ddbdf0ee375')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}