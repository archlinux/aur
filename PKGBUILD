# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=nft_tool
pkgname="${_pkgname//_/-}-bin"
_appname="Bitshares NFT issuance tool"
pkgver=1.7.2
_electronversion=25
pkgrel=6
pkgdesc="A tool for creating and editing NFTs on the Bitshares blockchain"
arch=('x86_64')
url="https://github.com/BTS-CM/Bitshares_NFT_Issuance_Tool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/BTS-CM/Bitshares_NFT_Issuance_Tool/v${pkgver}/License.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('87323c333009c7c19b9e904342f180ec9cc66f1d26ac6776fff5806a6193af68'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin}|g;s|=${_pkgname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -e "s|indexURL = app.isPackaged|indexURL = !app.isPackaged|g" \
        -e "s|(!app.isPackaged)|(app.isPackaged)|g" \
        -i "${srcdir}/app.asar.unpacked/dist/electron.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}