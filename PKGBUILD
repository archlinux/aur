# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=seven-waves
_pkgname=7-Waves
pkgver=1.2.0
pkgrel=2
pkgdesc="A dodging game with 7 levels of increasing difficulty"
arch=('x86_64')
url="https://github.com/Togohogo1/7-Waves"
license=("custom:CC0-1.0")
conflicts=("${pkgname}")
depends=('bash' 'electron')
makedepends=('gendesk' 'npm' 'yarn' 'imagemagick')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('13482c656539fab936193fe50fad9291a374a0a6db33a77e4b80a05a4464a96a'
            '516fa40c0fafe2ff3e3234f1a9bacd1e7e458b58dbc42a96699cc030028aa408')
prepare() {
    gendesk -q -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed "s|builder build|builder --linux AppImage|g" -i package.json
    yarn install
    yarn dist
    convert "${srcdir}/${_pkgname}-${pkgver}/assets/flag.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-8.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
