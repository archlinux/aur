# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=basic-blackjack-bin
_pkgname="Basic Blackjack"
pkgver=0.5.3
_electronversion=25
pkgrel=1
pkgdesc="An overly-simplified version of the Blackjack card game"
arch=("x86_64")
url="https://devklick.github.io/basic-blackjack/"
_ghurl="https://github.com/devklick/basic-blackjack"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /}_v${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('3088ae938b73107079e33b1736da8c256f43097120cee8ba79f22dbf0bd5be44'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${_pkgname}/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}