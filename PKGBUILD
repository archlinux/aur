# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gmail-desktop-appimage
pkgver=3.0.0.alpha.35
_appver=3.0.0-alpha.35
pkgrel=1
pkgdesc="Nifty Gmail desktop app (nnofficial)"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
conflicts=("${pkgname%-appimage}")
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${_appver}/${pkgname%-appimage}-${_appver}-linux.AppImage"
    "LICENSE::https://raw.githubusercontent.com/timche/gmail-desktop/main/LICENSE")
sha256sums=('6bd96180999f385c23c6d01438fd3f8f497c6d63e44db3694d658b629f6f6bdb'
            '056c7c1e5bf66eba0167d966d192c743f6b66ed854011c9b6dac04f959f8f5b5')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/gmail-desktop.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}