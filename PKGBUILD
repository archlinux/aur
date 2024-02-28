# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-you-bin
pkgver=3.0.0_alpha.4
_electronversion=27
pkgrel=3
pkgdesc="一个美观简约的Material Design 3 (Material You) 风格网易云音乐播放器pc客户端"
arch=('x86_64')
url="https://music-you-next.vercel.app"
_ghurl="https://github.com/GuMengYu/music-you"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('5891c59ea7856d4b9c83462c6d2bfa16e3c88655115d486a2f76d20b2c6f1c43'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g;s|Audio;Music|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|IndexUrl = require|IndexUrl = !require|g" -i "${srcdir}/app.asar.unpacked/dist-electron/main/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}