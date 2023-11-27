# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=station-appimage
_pkgname=Station
pkgver=2.6.0
pkgrel=1
pkgdesc="The first open-source smart browser for busy people. A single place for all of your web applications."
arch=('x86_64')
url="https://getstation.com/"
_ghurl="https://github.com/getstation/desktop-app"
license=('Apache')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
makedepends=(
    'squashfuse'
)
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${CARCH}.AppImage")
sha256sums=('fb9b57441fbc21fd88a919183cba4efbe32c94db2d90bdfe080ab841cdd171f5')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g;s|${pkgname%-appimage}-desktop-app|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}-desktop-app.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}-desktop-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
}