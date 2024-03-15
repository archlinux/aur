# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serina-bin
_pkgname=Serina
pkgver=0.4.0
_electronversion=24
pkgrel=4
pkgdesc="GUI for create translation files for i18next"
arch=('x86_64')
url="https://orn-fox.github.io/serina-1/"
_ghurl="https://github.com/ORN-Fox/serina-1"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'nodejs'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/R${pkgver}/${pkgname%-bin}-${pkgver//./-}-linux-x64.zip"
    "${pkgname%-bin}".sh
)
sha256sums=('69d3988f02868299b31f974d1d3774431998a14a18e6469be0675211d290b524'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/resources/app/icons/icon-x64.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}