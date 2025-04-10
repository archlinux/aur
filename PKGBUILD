# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postbird-bin
_pkgname=Postbird
pkgver=0.8.4
_electronversion=6
pkgrel=9
pkgdesc="Open source PostgreSQL GUI client.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Paxa/postbird"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Paxa/postbird/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('e3cc9eb893a35ddd0cc93ca10e526957c9c04896044a3b7c0f445daad45adfea'
            'd93e84fa24bbea7e92d6cd171968d8da1f4a28047cc704f0700d17b57c7a9a9c'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\///g
        s/Programming/Development/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}