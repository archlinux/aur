# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=grx-bin
_appname=GRX
pkgver=2.1.3
pkgrel=4
pkgdesc="Fastest Web Gerber Renderer"
arch=('x86_64')
url="https://grx.creery.org/"
_githuburl="https://github.com/hpcreery/GRX"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron24')
makdedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}.deb"
    "https://raw.githubusercontent.com/hpcreery/GRX/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('8221259df476971fffd25bee80132d61d08ffe2088fc4688920ea8de7c720526'
            '6af73551667116d187b1a4e5dac0933f99a4c1151bd1a44c12249cd540a69444'
            '6eea2230cebbd9b2924f28406b32d95e0d026bdd4da8e437a3863950b2709215')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}