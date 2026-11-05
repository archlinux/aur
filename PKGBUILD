# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pedax-bin
pkgver=6.122.0+222
pkgrel=1
pkgdesc="Reversi Board with edax, which is the strongest reversi engine."
arch=('x86_64')
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
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-ubuntu-latest.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('482aed119afc0c774eef9974518c7480d0a15540d0d8c6ce09877c819f849d50'
            'a46613b6df5ea182d243b68fa5ed3df97f307cf9d81788c9ff4c0e1d6f671dfe')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/data/flutter_assets/assets/images/${pkgname%-bin}_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
