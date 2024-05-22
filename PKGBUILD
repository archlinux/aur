# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pharmaspot-bin
_pkgname=Pharmaspot
_cfgdirname=PharmaSpot
pkgver=1.4.3
_electronversion=22
pkgrel=1
pkgdesc="A cross-platform Point of Sale system designed for pharmacies and built to streamline operations and enhance customer service."
arch=("x86_64")
url="https://github.com/drkNsubuga/PharmaSpot"
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
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/drkNsubuga/PharmaSpot/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/drkNsubuga/PharmaSpot/v${pkgver}/assets/images/favicon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('273bde007b40b61cef85339ea2778a2a0f7f2df1bbb47f544e4666a63c6ebd36'
            '66d59240c025ee617d78f981b88b1bb53393e657f064f9e8e0d68204644d8e1c'
            'ba44229f6c0a35bb02fe584adb1b33029c78a80b2bdb96877ddff05c3b6ac17a'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_cfgdirname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" \
                     --pkgdesc="${pkgdesc}" \
                     --categories="Utility" \
                     --name="${_pkgname}" \
                     --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${_pkgname%-bin}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}