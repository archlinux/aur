# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Thomas Höß <hi@thomsn.de>
# Contributor: Prepros <hi@prepros.io>
# Contributor: solopasha <daron439 at gmail dot com>
pkgname=prepros-bin
_pkgname=Prepros
pkgver=7.17.0
pkgrel=1
pkgdesc="Prepros compiles your files, transpiles your JavaScript, reloads your browsers and makes it really easy to develop & test your websites so you can focus on making them perfect."
arch=('x86_64')
url="https://prepros.io"
license=('custom:proprietary')
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::https://downloads.prepros.io/v7/${pkgver}/${_pkgname}-${pkgver}.deb"
    "${pkgname%-bin}.sh")
sha256sums=('59d8f34ac6769dd991125afadfe7e490527b55f9d9b33e928241d0e2ce9a9fe5'
            '4ec2ed24f8f45b49a479a3546325e8defd05b75b1abf8ef9a321b1047cadabad')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar e "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/"{default_app.asar,icon.png} -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/license"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}