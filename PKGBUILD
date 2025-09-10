# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lagrange-bin
_pkgname=Lagrange
_appname="fi.skyjake.${_pkgname}"
pkgver=1.19.1
pkgrel=1
pkgdesc="A Beautiful Gemini Client.(Prebuilt version)"
arch=(
    'armv7h'
    'x86_64'
)
url="https://gmi.skyjake.fi/lagrange/"
_ghurl="https://github.com/skyjake/lagrange"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libdrm'
    'libgpg-error'
    'mesa'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/skyjake/lagrange/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-armhf.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage")
sha256sums=('d8dd2acc4ba121ca7da3c899c8c443484ab54526ed5933e34fffae2cedb28fbe'
            '574c9abedf1d4ff7d577a1e180faffeab850eb2aa4eaff000946025787185895')
sha256sums_armv7h=('1d75c58c18e8365909375a66d089a5d25b2713f97a77a6286836ba9bbabe6f56')
sha256sums_x86_64=('8b062ab4fa77bbed779348571da29752cfac053280fa58a9063bf30696770c09')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,share} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}