# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=airdrop_tool
pkgname="${_pkgname//_/-}-bin"
_appname="Bitshares Airdrop tool"
pkgver=0.3.31
_electronversion=26
pkgrel=3
pkgdesc="Fetch & analyse blockchain tickets. View leaderboards and user tickets. Calculate and perform provably fair airdrops."
arch=('x86_64')
url="https://github.com/BTS-CM/airdrop_tool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/BTS-CM/airdrop_tool/v${pkgver}/License.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('1e7ea870a92905605c2905f1193ba022e88c24d0fcc9e437b641e1bba37ced19'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin} --no-sandbox|g;s|=${_pkgname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "42s|app.isPackaged|!app.isPackaged|g;53s|!app.isPackaged|app.isPackaged|g" -i "${srcdir}/app.asar.unpacked/dist/electron.js"
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