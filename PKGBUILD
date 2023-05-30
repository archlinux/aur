# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="lagrange-appimage"
_appname="fi.skyjake.Lagrange"
pkgver=1.16.2
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
sha256sums_x86_64=('1fcef54331b15ae2e3db4eb9f05c2460d1a189f65d72475756ec927956d0ba40')
sha256sums_aarch64=('d275102526a0c420a290293a13a2babf44f445ac7cd86d4e59c84ad5904e52f3')
sha256sums_armv7h=('d275102526a0c420a290293a13a2babf44f445ac7cd86d4e59c84ad5904e52f3')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    sed "s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
}