# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yank-note-appimage"
pkgver=3.52.1
pkgrel=1
pkgdesc="A Hackable Markdown Note Application for Programmers."
arch=('x86_64')
url="https://demo.yank-note.com/"
_githuburl="https://github.com/purocean/yn"
license=('AGPL3')
provides=()
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Yank-Note-linux-x86_64-${pkgver}.AppImage")
sha256sums=('4ac0c73adafbc96500f4b22b3ed11b67455e827adc8c21e9860f0fc1d4bf0243')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/yank-note.AppImage|g;s|=Markdown|=Development|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
