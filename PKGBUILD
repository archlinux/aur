# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=station-appimage
pkgver=2.3.0
pkgrel=2
pkgdesc="The first open-source smart browser for busy people. A single place for all of your web applications."
arch=('x86_64')
url="https://getstation.com/"
_githuburl="https://github.com/getstation/desktop-app"
license=('Apache')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Station-${CARCH}.AppImage")
sha256sums=('be94e1be5af017f74be9354d497efba51e5ed57e28989196242f800fd76e3198')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${pkgname%-appimage}-desktop-app|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}-desktop-app.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}-desktop-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
}