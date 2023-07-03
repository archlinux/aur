# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="saber-appimage"
_appname="com.adilhanney.saber"
pkgver=0.14.3
pkgrel=1
pkgdesc="A (work-in-progress) cross-platform libre handwritten notes app"
arch=('x86_64')
url="https://github.com/adil192/saber"
license=('GPL3')
options=('!strip')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Saber-${pkgver}-${CARCH}.AppImage")
sha256sums=('034e75ca0fcf4877dd55bb8eecc8bbea3e20587f0b2369cbb5cb3ed947b4bcc9')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|Icon=${_appname}|Icon=${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.metainfo.xml"
}