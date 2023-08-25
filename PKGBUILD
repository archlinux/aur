# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snsdeck
pkgver=0.0.2
pkgrel=1
pkgdesc="SNS Viewer like TweetDeck"
arch=('any')
url="https://github.com/meganii/snsdeck"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'asar' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('d93cc29675a36a5f0d63700581da015c32bd1326aa24f4ce2d0e6dcc54a07123'
            'ff4900d33943117c871fed30ff62d669ffbe4d009e15e406ba1608a3ec7b1f4f')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    sed '15,28d' -i forge.config.js
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-"*/resources/app.asar "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}