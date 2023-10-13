# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=proton-mail-viewer
pkgver=0.0.1
pkgrel=2
pkgdesc="Unofficial Proton Mail™ viewer"
arch=('any')
url="https://github.com/moba1/proton-mail-viewer"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('be363cd7f2b099970ce074f5fc3b62a4027f5312f18df52744e85f28d0296b86'
            '0eec9d27112247ea0174a2b34157e1eda206bda5f9cd9409306ad4d61f72df58')
prepare() {
    gendesk -f -n -q --categories "Network;Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '30,39d' -i forge.config.ts
    npm i --frozen-lockfile
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-"*/resources/app.asar -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/images/icons/${pkgname}-icon_512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}