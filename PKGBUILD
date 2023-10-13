# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frontimer
pkgver=0.1.15
pkgrel=2
pkgdesc="Desktop timer application always displayed in the forefront of the screen"
arch=('any')
url="https://github.com/seita1996/frontimer"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron23')
makedepends=('gendesk' 'nodejs>=18.12.1' 'npm' 'yarn')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('62c16c0ba0cf123b4bcef772e49a4da401c47f91cdc84a7f34be332482a75391'
            '9b8b0a2e8246704e802fb23238ee2bda31cbfb0f0557796cf528102f881ad325')
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
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/ft-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}