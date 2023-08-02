# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chatgptx-appimage"
pkgver=1.0.1
pkgrel=2
pkgdesc="A tray app for ChatGPT. Using this app you can easily access the ChatGPT from your system tray."
arch=('x86_64')
url="https://github.com/florindumitru/chatgpt-desktop-tray"
license=('MIT')
provides=("${pkgname%-appimage}-${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/ChatGPTx-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/florindumitru/chatgpt-desktop-tray/master/license")
sha256sums=('8809560c657d1e825ee6f7551880d1f266c514e770293f36e90fcaa8b6c62402'
            'c4b2ddb85db30368f3e6c0ffb7ea3de437c72ea65504c2281cdb929bb920b670')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}