# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frigoligo-bin
_pkgname=Frigoligo
pkgver=1.0.1
pkgrel=1
pkgdesc="An universal wallabag client made with Flutter. "
arch=('x86_64')
url="https://github.com/casimir/frigoligo"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/casimir/frigoligo/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/casimir/frigoligo/v${pkgver}/assets/logos/${pkgname%-bin}.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('fafa5e8a9d15110b1d5477ae59003f92e8a85525a31e8bc272106612cbb0b9c7'
            '3feb1ea09cc75f148e715820992fd28a3881572e3540b629059f22293b2e17db'
            '886063acc61302d4ee369f06b6062257883dd4e3f1d6ab199ca8e64db3091491'
            'b80a05fa761440dc131976b08181f3f064acaf78d273d50bf418778bd5f10238')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${srcdir}/opt"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}