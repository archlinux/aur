# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=huelectron-bin
_pkgname=huElectron
pkgver=0.6.1
_electronversion=24
pkgrel=8
pkgdesc="An open-source and cross-platform app for the Hue lighting system from Philips - built on Electron."
arch=(x86_64)
url="https://github.com/4ch1m/huElectron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
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
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Development;Utility" --name="${_pkgname}" --exec="${pkgname} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}