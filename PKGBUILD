# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gitify-appimage
pkgver=4.3.1
pkgrel=1
pkgdesc="GitHub notifications on your menu bar. Available on macOS, Windows & Linux."
arch=('x86_64')
url="https://www.gitify.io/"
_githuburl="https://github.com/manosim/gitify"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Gitify-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/manosim/gitify/main/LICENSE")
sha256sums=('1632f1811d914f8a613553d0c5843cb751edf97383416783a67944179e159e84'
            '7f5456bd16b4821925351b713bc5f885f520994292e589982dd2a51bcebf3c14')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/gitify.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}