# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jammer-bin
_pkgname=Jammer
pkgver=3.47
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
sha256sums=('2d617cd0426a4f22fba4677e78bf3c9a87f830ae1670be1061476a50c268e4d8'
            '4180466c6844a66fb5b14577317e4ddb2863d3b7f4c285cdbf76b5990412c892'
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