# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electrocrud-bin
_pkgname=ElectroCRUD
pkgver=3.1.0_develop.1
_electronversion=22
pkgrel=10
pkgdesc="Database CRUD Application Built on Electron | MySQL, Postgres, SQLite"
arch=('x86_64')
url="http://garrylachman.github.io/ElectroCRUD/"
_ghurl="https://github.com/garrylachman/ElectroCRUD"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-appimage}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-v${pkgver//_/-}-linux-x64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('6bd3e133f38beb97f8856254f09f28dd8f506ec127e3a3ae2020e65f046a441b'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}