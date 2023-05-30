# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whatsapp-for-linux-appimage
_origname=com.github.eneshecan.WhatsAppForLinux
pkgver=1.6.3
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for Linux."
arch=('x86_64')
url="https://github.com/eneshecan/whatsapp-for-linux"
license=('GPL3')
options=(!strip)
conflicts=()
providers=(eneshecan    )
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage")
sha256sums=('05b2a60b4b9e8526f745d467cdac2d2b1db43c16f34f56a8e057aa6f0eda6f7d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_origname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_origname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 16x16 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_origname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_origname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_origname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
}