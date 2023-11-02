# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ptree-bin
_pkgname=PTree
pkgver=2.2.0
pkgrel=1
pkgdesc="Design power tree and estimate consumptions"
arch=("x86_64")
url="https://smariel.github.io/PTree"
_githuburl="https://github.com/smariel/PTree"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron11'
    'hicolor-icon-theme'
)
makedepends=(
    'asar'
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('4c15d219bd9e2c1a4aaa1da94931d19a133ddfd9d6178e5f21fdea97ab22f54c'
            '24fbd05573ab5f8cc13cc257a238d3c81bcb2a2c49aa8c32027ff40426515442')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
    asar e "${srcdir}/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/app.asar.unpacked/icons/png/app/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}