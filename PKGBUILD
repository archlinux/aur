# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tome-bin
_pkgname=Tome
pkgver=0.8.0
_electronversion=22
pkgrel=2
pkgdesc="Git integrated cross-platform markdown editor"
arch=("x86_64")
url="https://tome.evinowen.net/"
_ghurl="https://github.com/evinowen/tome"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}.Setup.${pkgver}.deb"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/evinowen/tome/${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('1f7119842532cb4bb3907a672edd38264b7c4ca8d73e6d486efea98cb51e93d8'
            '3103a7058613516746435f89ff07509d42d9a07a485ad7b7fbc2781b06be4722'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}