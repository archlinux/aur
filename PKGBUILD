# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=objtoschematic-bin
_pkgname=ObjToSchematic
pkgver=0.7.1
_electronversion=13
pkgrel=11
pkgdesc="A tool to convert 3D models into Minecraft formats such as .schematic, .litematic, .schem and .nbt"
arch=('x86_64')
url="https://objtoschematic.com/"
_ghurl="https://github.com/LucasDower/ObjToSchematic"
license=('BSD-3-Clause')
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
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/LucasDower/ObjToSchematic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5953facd08818a8c35a4360f220ecf72d681c37f979db85f028b5c5b8eb086c8'
            '013faf6901a4a9e6538ef3424509efb52c41dcde40070a97c6789c83c9c6de2e'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Game" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux-x64/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/${_pkgname}-${pkgver}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux-x64/resources/app/res/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}