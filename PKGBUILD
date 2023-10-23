# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytm-dlp-gui
pkgver=1.0.3
pkgrel=1
pkgdesc="An ElectronJS app for downloading music off Youtube Music."
arch=('x86_64')
url="https://github.com/RENOMIZER/ytm-dlp-gui"
license=('ISC')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'npm' 'asar' 'nodejs' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('81013100cfab45a0a4aa23a602b893ffc22f75ec3c309b2496b5f309f3f65a22'
            '82e5f9af0055daab3e4e1f12e18fb1621c08844b88aaa9e8884fdaed23a92098')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '46,49d' -i forge.config.js
    npm ci
    npm run make
    convert "${srcdir}/${pkgname}-${pkgver}/src/images/icon.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-0.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}