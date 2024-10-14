# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lagrange-bin
_pkgname=Lagrange
_appname="fi.skyjake.${_pkgname}"
pkgver=1.18.2
pkgrel=1
pkgdesc="A Beautiful Gemini Client.Prebuilt version."
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
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/skyjake/lagrange/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-armhf.AppImage")
sha256sums=('d8dd2acc4ba121ca7da3c899c8c443484ab54526ed5933e34fffae2cedb28fbe'
            '574c9abedf1d4ff7d577a1e180faffeab850eb2aa4eaff000946025787185895')
sha256sums_armv7h=('05a64724132ba055100625e1c8f4f3d131c7b7f8c78757c39cc2822ec0cc58e0')
sha256sums_x86_64=('c8b10447abeb576319dd9134ac49c205c6c3cd5ec877c40743f2799a74ee5795')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,share} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}