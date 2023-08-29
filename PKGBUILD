# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frontimer
pkgver=0.1.15
pkgrel=1
pkgdesc="Desktop timer application always displayed in the forefront of the screen"
arch=('any')
url="https://github.com/seita1996/frontimer"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron23')
makedepends=('gendesk' 'nodejs>=18.12.1' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('2c06cfd38ee18868145b0f97ae2ebbd22cfab92cab66112e22418b87d41d7d3f'
            'a0f4809165f3f52ba80973d379e9f0e5275d29ae946367b8d597fdbfdd2d8dc1')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run build
    npx electron-builder --linux AppImage
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/ft-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}