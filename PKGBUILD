# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vgmtrans-bin
_pkgname=VGMTrans
pkgver=1.1_preview
pkgrel=1
pkgdesc="A tool to convert proprietary, sequenced videogame music to industry-standard formats"
arch=('x86_64')
url="https://github.com/vgmtrans/vgmtrans"
license=('libpng')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libice'
    'libglvnd'
    'libx11'
    'harfbuzz'
    'libsm'
    'fontconfig'
)
makedepends=(
    'squashfuse'
)
options=("!strip")
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver%_preview}/${pkgname%-bin}-preview-v${pkgver%_preview}.AppImage"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/vgmtrans/vgmtrans/v${pkgver%_preview}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('a9d94aedde9992602fb1b93093783d236a8310a71227b2dd0597914deb4a89bc'
            '3204441b667402c3720e32139a48fcb32d4c5dc7c2e464de415b24b9185adb7c'
            'ebbda89f7ae9af354c4e54f363321d288f991e64b2659c28a6ab69a348ea47e4')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-bin}|Exec=${pkgname%-bin} %U|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,plugins} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}