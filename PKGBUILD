# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pedax-bin
pkgver=6.86.0
_subver=184
pkgrel=1
pkgdesc="Reversi Board with edax, which is the strongest reversi engine.(Prebuilt version)"
arch=("x86_64")
url="https://sensuikan1973.github.io/pedax/"
_ghurl="https://github.com/sensuikan1973/pedax"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}%2B${_subver}/${pkgname%-bin}-ubuntu-latest.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('1e0a64e219090fbce5ae180962a7f934ed4240f1637d9d7e2cc34bb73736e607'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/data/flutter_assets/assets/images/${pkgname%-bin}_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
