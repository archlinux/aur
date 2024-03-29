# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pharmaspot-bin
_pkgname=Pharmaspot
pkgver=1.4.1
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
sha256sums=('4814c7009534caa7b22a46da33f6551f237a077d987a695eb7eb57756c849c49'
            '66d59240c025ee617d78f981b88b1bb53393e657f064f9e8e0d68204644d8e1c'
            'ba44229f6c0a35bb02fe584adb1b33029c78a80b2bdb96877ddff05c3b6ac17a'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${_pkgname%-bin}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}