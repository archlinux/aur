# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jammer-bin
_pkgname=Jammer
pkgver=3.50
pkgrel=1
pkgdesc="Play songs in cli with youtube and soundcloud support.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/jooapa/jammer"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxt'
    'libxtst'
    'libxinerama'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jooapa/jammer/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('571e6f87ac46ae0307b873db70768dfc1234f70bb49dd16b69c034782f0a8c75'
            '551f3173ed7196d0ffc218873820c270171c788602b03b05c0c17929ea9d993e'
            '6731a288a4110a682e80c898ff52bb4d3ff5f5849dcc3b7f6814279391d12ba4')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ]; then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Categories=Music/Categories=AudioVideo;/g
        s/${_pkgname}-icon/${pkgname%-bin}/g
        5i\Comment=${pkgdesc}
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{lib,locales} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
