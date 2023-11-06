# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=solar-wallet-bin
_pkgname=solarwallet
_appname="Solar Wallet"
_debname="io.${_pkgname}.app"
pkgver=0.28.1
pkgrel=3
pkgdesc="Stellar wallet. Secure and user-friendly."
arch=('x86_64')
url="https://solarwallet.io/"
_githuburl="https://github.com/satoshipay/solar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=(
    'bash'
    'electron19'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Solar-Wallet-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/satoshipay/solar/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('bbf429ba5faf083f602f087970bf6cfddc0178b743432f588d7d2c90764997b3'
            '122419a299dfabb6da3af79d00ffafba42ae185fa757be14cd5140f35c8ce094'
            '961c94ebb3a3f1a4435c39482be499d41deac19a68d5ad2e149b8f4183a9b0a8')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp "${srcdir}/app.asar.unpacked/dist/index.prod.html" "${srcdir}/app.asar.unpacked/dist/index.dev.html"
    rm -rf "${srcdir}/app.asar.unpacked/node_modules/sodium-native/tmp"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|\"/opt/${_appname}/${_debname}\" %U|${pkgname%-bin}|g;s|=${_debname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_debname}.desktop"
}
package() {
    install -Dm755 "${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_debname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}