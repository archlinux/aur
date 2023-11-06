# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lagrange-appimage
_pkgname=Lagrange
_appname="fi.skyjake.${_pkgname}"
pkgver=1.17.3
pkgrel=1
pkgdesc="A Beautiful Gemini Client"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://gmi.skyjake.fi/lagrange/"
_githuburl="https://github.com/skyjake/lagrange"
license=('BSD')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
options=('!strip')
_install_path="/opt/appimages"
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage")
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-armhf.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-armhf.AppImage")
sha256sums_aarch64=('79bda88760f045f495321bb9638c7a5fe9e4f488143c52eb04255cca682e89b7')
sha256sums_armv7h=('79bda88760f045f495321bb9638c7a5fe9e4f488143c52eb04255cca682e89b7')
sha256sums_x86_64=('26c1c912bcedb9ad5bc336af58489f95db71072622303572fceee8daf7c01ca8')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|%U|--no-sandbox %U|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    sed "s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
}