# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=sqlectron
pkgname="${_pkgname}-gui-bin"
pkgver=1.38.0
pkgrel=4
pkgdesc="A simple and lightweight SQL client desktop with cross database and platform support."
arch=('x86_64')
url="https://sqlectron.github.io/"
_githuburl="https://github.com/sqlectron/sqlectron-gui"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron12'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman"
    "LICENSE::https://raw.githubusercontent.com/sqlectron/sqlectron-gui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('17eb28d4f4e34f619471f71edc68de5768791549e3313295d98f4cd2a991b6ff'
            '87b56cd5c7ac2bbf995ae64079519a228e20d86b15a16a75fa109c7611bb1e19'
            '5289ab9daefb1732bfe8213ebf9c6499a421ce8b836750a92e51a199d8e157e6')
build() {
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}