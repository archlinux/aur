# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pedax-bin
pkgver=6.51.0
_subver=147
pkgrel=1
pkgdesc="Reversi Board with edax, which is the strongest reversi engine."
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
sha256sums=('7fc09fab5b33498ccec171bd0e393c772475383020ca4f35e5c4af52ef0936a6'
            '840eb0ad528d294064aa09b2b6df7a0e4a800249f43305c756cf78bee627fe1d')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/images/${pkgname%-bin}_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}