# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altarik-launcher-bin
_pkgname=Altarik-Launcher
pkgver=2.1.6
_electronversion=28
pkgrel=3
pkgdesc="A Minecraft custom launcher developped to launch the game with our own modpack."
arch=('x86_64')
url="https://altarik.fr/"
_ghurl="https://github.com/AltarikMC/Launcher"
license=("BSD-3-Clause")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'imagemagick'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/AltarikMC/Launcher/${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.ico::https://raw.githubusercontent.com/AltarikMC/Launcher/${pkgver}/icon.ico"
    "${pkgname%-bin}.sh"
)
sha256sums=('1d11ebd18c78384ec2ad21c512d2036c2702a36c815033fe1c028a27e2a74ba4'
            '3a3a7d8474ca58bf2620f0a95275445faf654df7d4061afc209458b5fc8f8a2c'
            '5dbc783060b213ca39548ace82bbc9a2ffa35031b70728027a7a8e14dad2260a'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    convert "${srcdir}/${pkgname%-bin}-${pkgver}.ico" "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n --categories="Game" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname//-/ }-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname%-bin}-6.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}