# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bdash-appimage"
pkgver=1.16.0
pkgrel=1
pkgdesc="Simple SQL Client for lightweight data analysis."
arch=('x86_64')
url="https://github.com/bdash-app/bdash"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Bdash-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/bdash-app/bdash/master/LICENSE")
sha256sums=('557b4bb9369b79effb9cad04d8d2837d4328962692a0c3b3dcde4b7be883fb9c'
            '44e997a14d296ed01f24a68d2071280936534e98f4613fa8b875c9922e6b22d8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/bdash.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
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