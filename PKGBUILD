# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="lagrange-appimage"
_appname="fi.skyjake.Lagrange"
pkgver=1.16.1
pkgrel=1
pkgdesc="A Beautiful Gemini Client"
arch=('x86_64')
url="https://gmi.skyjake.fi/lagrange/"
_githuburl="https://github.com/skyjake/lagrange"
license=('BSD')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Lagrange-${pkgver}-${arch}.AppImage")
sha256sums=('8fdace09814903681c00c9bcfc3562b10af7672c809f75e2b3cb0aa3e2f4c5cf')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    sed "s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
}