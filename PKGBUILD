# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=solar-wallet-bin
_pkgname=solarwallet
_appname="Solar Wallet"
_debname="io.${_pkgname}.app"
pkgver=0.28.1
_electronversion=19
pkgrel=8
pkgdesc="Stellar wallet. Secure and user-friendly."
arch=('x86_64')
url="https://solarwallet.io/"
_ghurl="https://github.com/satoshipay/solar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=(
    "electron${_electronversion}"
    'python>=3'
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname// /-}-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/satoshipay/solar/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('bbf429ba5faf083f602f087970bf6cfddc0178b743432f588d7d2c90764997b3'
            '122419a299dfabb6da3af79d00ffafba42ae185fa757be14cd5140f35c8ce094'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_appname}/${_debname}\"|${pkgname%-bin}|g;s|=${_debname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_debname}.desktop"
}
package() {
    install -Dm755 "${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_debname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}