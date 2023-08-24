# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=proton-mail-viewer
pkgver=0.0.1
pkgrel=1
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
            '1547d9907169a9c2fe546d80768276d9647a573772453174e1758adaf336bed6')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm i --frozen-lockfile
    sed '30,39d' -i forge.config.ts
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-"*/resources/app.asar "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/images/icons/${pkgname}-icon_512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Network;Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}