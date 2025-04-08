# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=huelectron-bin
_pkgname=huElectron
pkgver=0.6.1
_electronversion=24
pkgrel=10
pkgdesc="An open-source and cross-platform app for the Hue lighting system from Philips - built on Electron.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/4ch1m/huElectron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/4ch1m/huElectron/${pkgver}/app/img/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('8d3ea2043a7fee5a83a6ff34b97b93acc7cb98318e2ff08d827bb2a8ca5bd94f'
            '1f3f81918f9254f49488f0a113f55bd1da262b9300026d927b21cd10e895bcc6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}