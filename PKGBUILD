# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=giada-appimage
pkgver=0.25.1
pkgrel=2
pkgdesc="An open source, minimalistic and hardcore music production tool. Designed for DJs, live performers and electronic musicians."
arch=('x86_64')
url="https://www.giadamusic.com"
_githuburl="https://github.com/monocasual/giada"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/data/Giada-${pkgver}-${CARCH}.AppImage")
sha256sums=('530a577c11677fa1f6844ebca8ac249e0ca7a92e4919bbd34f9c6f2367e038da')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}