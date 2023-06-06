# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="web-os-dev-manager-appimage"
pkgver=1.11.15
pkgrel=1
pkgdesc="Device/DevMode Manager for webOS TV"
arch=('x86_64')
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}_${pkgver}_amd64.AppImage")
sha256sums=('7c2a267fabf8c4dc148c514e6863a54f4914b7ee999a5bf0bd6712c7113315fc')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
  done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}