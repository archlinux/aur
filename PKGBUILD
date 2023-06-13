# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="woocommerce-pos-appimage"
pkgver=1.2.1
pkgrel=1
pkgdesc="Electron Desktop App for WooCommerce POS"
arch=('x86_64')
url="https://github.com/wcpos/electron"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/WooCommerce-POS-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/wcpos/electron/main/LICENSE")
sha256sums=('0c85836f32ef1627fde79ef27487cdff729a12314451403eba79cd289dc101b7'
            'd8a5569300a1a9624f8e32056d771809676dc7dcaf3ed1ba900c635c426f28e7')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}