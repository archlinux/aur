# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tockler-appimage
_pkgname=Tockler
pkgver=3.21.18
pkgrel=4
pkgdesc="An application that tracks your time by monitoring your active window title and idle time."
arch=('x86_64')
url="https://tockler.io/"
_ghurl="https://github.com/MayGo/tockler"
license=('GPL2')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme' 
)
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('0f9702f1ca0e390825171d3bdbbdf495e1dcc787c50531f39969ece1f3e656df')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}