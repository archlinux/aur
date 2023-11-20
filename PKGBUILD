# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lagrange-appimage
_pkgname=Lagrange
_appname="fi.skyjake.${_pkgname}"
pkgver=1.17.4
pkgrel=1
pkgdesc="A Beautiful Gemini Client"
arch=(
    'armv7h'
    'x86_64'
)
url="https://gmi.skyjake.fi/lagrange/"
_githuburl="https://github.com/skyjake/lagrange"
license=('BSD')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=("LICENSE.md::https://raw.githubusercontent.com/skyjake/lagrange/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-armhf.AppImage")
sha256sums=('d8dd2acc4ba121ca7da3c899c8c443484ab54526ed5933e34fffae2cedb28fbe')
sha256sums_armv7h=('11cd45c5d763affbb55385144346e0d0bc7a084ba26f685bd030467687866475')
sha256sums_x86_64=('a830c2890b16efe5b80a7788bfa092cd873ffddba44bf931ee534da131b29d55')
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
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}