# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yaradio-yamusic-bin
_pkgname=YaMusic.app
pkgver=1.0.6
_electronversion=9
pkgrel=4
pkgdesc="Yandex Radio + Yandex Music desktop application - Неофициальное десктопное приложение для Яндекс Радио + Яндекс Музыка"
arch=('x86_64')
url="https://github.com/dedpnd/yaradio-yamusic"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/dedpnd/yaradio-yamusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('bc11bda087e19d56ad4c120e34183dfe0edfd47d538d87eae56254ba41a81a26'
            'cea59fab6a546b299040932620ad01ba4f590cc427ebd9d6f3ae8c271a1055ac'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g;s|Audio|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}