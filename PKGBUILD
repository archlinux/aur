# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vgmtrans-appimage
_pkgname=VGMTrans
pkgver=1.1_preview
pkgrel=4
pkgdesc="A tool to convert proprietary, sequenced videogame music to industry-standard formats"
arch=('x86_64')
url="https://github.com/vgmtrans/vgmtrans"
license=('libpng')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'squashfuse'
)
options=("!strip")
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver%_preview}/${pkgname%-appimage}-preview-v${pkgver%_preview}.AppImage"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/vgmtrans/vgmtrans/v${pkgver%_preview}/LICENSE.txt"
)
sha256sums=('a9d94aedde9992602fb1b93093783d236a8310a71227b2dd0597914deb4a89bc'
            '3204441b667402c3720e32139a48fcb32d4c5dc7c2e464de415b24b9185adb7c')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${pkgname%-appimage} --no-sandbox %U|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}