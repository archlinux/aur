# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mini4wdchrono-bin
_pkgname=Mini4wdChrono
pkgver=0.18.1
_electronversion=9
pkgrel=7
pkgdesc="Software for Arduino based 3-lane lap timer for Tamiya Mini4wd."
arch=('x86_64')
url="https://github.com/Pimentoso/mini4wdchrono"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Pimentoso/mini4wdchrono/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('75ea7c0a2dd1764f707a964f3a6f87a31500e835b5721d3092e34d415fe08c77'
            '9c1774cb6b3301c45bafb5f68c9787c3ce5dfcd909c56cce69ccec56568ff6a8'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}