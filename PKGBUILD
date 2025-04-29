# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pharmaspot-bin
_pkgname=Pharmaspot
_cfgdirname=PharmaSpot
pkgver=1.4.4
_electronversion=22
pkgrel=2
pkgdesc="A cross-platform Point of Sale system designed for pharmacies and built to streamline operations and enhance customer service.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.patternsdigital.com/pharmaspot"
_ghurl="https://github.com/drkNsubuga/PharmaSpot"
license=('MIT')
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
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/drkNsubuga/PharmaSpot/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/drkNsubuga/PharmaSpot/v${pkgver}/assets/images/favicon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('6b8f262b11aaa6d076d61d98ff1c1eb51728ac03fa473c46ab1fdbc95a1da398'
            '66d59240c025ee617d78f981b88b1bb53393e657f064f9e8e0d68204644d8e1c'
            'ba44229f6c0a35bb02fe584adb1b33029c78a80b2bdb96877ddff05c3b6ac17a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_cfgdirname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_cfgdirname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
