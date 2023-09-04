# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=station-appimage
pkgver=2.4.0
pkgrel=1
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
sha256sums=('c0933cda9b0fb657134af2f8f697b61ab32d620025f2e1218ecc207b08e8c86b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${pkgname%-appimage}-desktop-app|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}-desktop-app.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}-desktop-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
}