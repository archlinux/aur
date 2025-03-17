# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jammer-bin
_pkgname=Jammer
pkgver=3.44
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
sha256sums=('488389e88d337fa9fc3f5c0603f6c7806c8d0a40867aa9d3417b16887a45f31b'
            '551f3173ed7196d0ffc218873820c270171c788602b03b05c0c17929ea9d993e'
            '6731a288a4110a682e80c898ff52bb4d3ff5f5849dcc3b7f6814279391d12ba4')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Categories=Music/Categories=AudioVideo;/g
        s/${_pkgname}-icon/${pkgname%-bin}/g
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