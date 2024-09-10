# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=witsy-bin
_pkgname=Witsy
pkgver=1.12.3
_electronversion=29
pkgrel=1
pkgdesc="Generative AI desktop application"
arch=("x86_64")
url="https://github.com/nbonamy/witsy"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/nbonamy/witsy/v${pkgver}/assets/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('b0003ca7c335833a02b0e2bfebfc4e3b9171381c873359a184b4dda45654bf45'
            '1f290bf14df85930c04881b362b015791a0c94dd491979acfccb0bdcfd35e58e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}