# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=niconizer-bin
pkgver=2.0.127
_electronversion=29
pkgrel=1
pkgdesc="A desktop application that displays plain text, images, and any other HTML content on the screen."
arch=("x86_64")
url="https://github.com/matzkoh/niconizer"
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
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/matzkoh/niconizer/v${pkgver}/icon/icon_512x512.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('cda7b680ef6d75f4f3fb19703e4310a5250c7e774f4b1866415f9691d481fe23'
            '7c820610080a8d47f26c555d498ae391c89f2848de93cde005f1fd438e1e0236'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}