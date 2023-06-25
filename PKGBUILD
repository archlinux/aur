# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="lagrange-appimage"
_appname="fi.skyjake.Lagrange"
pkgver=1.16.5
pkgrel=1
pkgdesc="A Beautiful Gemini Client"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gmi.skyjake.fi/lagrange/"
_githuburl="https://github.com/skyjake/lagrange"
license=('BSD')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/Lagrange-${pkgver}-x86_64.AppImage")
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/Lagrange-${pkgver}-armhf.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/Lagrange-${pkgver}-armhf.AppImage")
sha256sums_x86_64=('63bead092a2771cde597f9e34507ffbb8138ea55fc5965e6c03bce19e287b9f6')
sha256sums_aarch64=('2eb38df1e2866836d29c0c9c44ee52f0e27680a9491fdb98b2a3ab939e7ccb8b')
sha256sums_armv7h=('2eb38df1e2866836d29c0c9c44ee52f0e27680a9491fdb98b2a3ab939e7ccb8b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    sed "s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
}