# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pharmaspot-bin
_pkgname=Pharmaspot
_cfgdirname=PharmaSpot
pkgver=1.5.0
_electronversion=37
pkgrel=1
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
sha256sums=('32f02c8aff573ea4e83228ef7cb7092b2b89b64294c3d9a8fe67f7b983c6e1b2'
            '66d59240c025ee617d78f981b88b1bb53393e657f064f9e8e0d68204644d8e1c'
            'ba44229f6c0a35bb02fe584adb1b33029c78a80b2bdb96877ddff05c3b6ac17a'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/${_cfgdirname}-linux-x64/${_cfgdirname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_cfgdirname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
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