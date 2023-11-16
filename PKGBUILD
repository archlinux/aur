# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=arctis-monitor-bin
pkgver=0.0.12
pkgrel=2
pkgdesc="Electron Tray application to view Battery Level of Arctis Headsets"
arch=("x86_64")
url="https://github.com/richrace/arctis-monitor"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron26'
    'libusb'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/richrace/arctis-monitor/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('35f546aa8a23eb79527a1ff489fa9ab9d1412f69fe2b15e75e43efcfa1e844e9'
            'bd5c70f61f5c60d42bffbadd12de9a6e0f3272afe8d869e7251d4f0c6d67025d'
            '8072d2781be81fe8c31f75111ea190a0b50289fff2b89afaa947fd51c01252b3')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}