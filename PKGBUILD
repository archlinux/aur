# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frontimer
pkgver=0.1.17
pkgrel=1
pkgdesc="Desktop timer application always displayed in the forefront of the screen"
arch=('any')
url="https://github.com/seita1996/frontimer"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'nodejs>=18.12.1' 'npm' 'yarn')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('745ae301f254db45975f6d76c8b631820871bba8002544d21a2135cd3e092d57'
            '1af4ec991bdd32eb41ad9b69256d2d44d02aa4cb09e6ce124b57771cb9f52e3b')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn build
    yarn electron-builder --linux AppImage
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}