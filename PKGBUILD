# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Thomas Höß <hi@thomsn.de>
# Contributor: Prepros <hi@prepros.io>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Martin
# Contributor: Adam Rustler
pkgname=prepros-bin
_pkgname=Prepros
pkgver=7.26.0
_electronversion=25
pkgrel=2
pkgdesc="Prepros compiles your files, transpiles your JavaScript, reloads your browsers and makes it really easy to develop & test your websites so you can focus on making them perfect.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://prepros.io"
license=('LicenseRef-custom')
depends=(
    "electron${_electronversion}"
    'perl'
    'ruby'
    'libva>=2.20.0'
    'nodejs'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://downloads.prepros.io/v7/${pkgver}/${_pkgname}-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('aa1f29308b2ed5c4335f18c1690fd6b3fed8b3a1dbd8803cab64934c1173cbe7'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}-7/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/license"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}