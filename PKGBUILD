# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frosch-bin
_appname=Frosch
pkgver=2.0.2
_electronversion=11
pkgrel=10
pkgdesc="Frosch, software para juego de rana electrónica o rana digital."
arch=(
    'i686'
    'x86_64'
)
url="https://github.com/ivanrey/Frosch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'gendesk'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_appname}-linux-ia32.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_appname}-linux-x64.zip")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ivanrey/Frosch/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('70d564391aa89ca77317a0716d27d450d939c41d0554a66da392b28784d6fa7d'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_i686=('78ca0dbd64a0e6e1155632219d3990a76358abd8c385ef88a7094edc1a8aa8b6')
sha256sums_x86_64=('16841565eecd5b9946711cfafdf9a0959c60fada1870c624f5d65f31cc31252f')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Game" --name="${_appname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/resources/app/icono.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}