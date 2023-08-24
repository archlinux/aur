# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bot.dev
pkgver=0.0.1
pkgrel=1
pkgdesc="Desktop app to manage Discord.js bots built with React, Electron and DaisyUI"
arch=('any')
url="https://github.com/juaneth/bot.dev"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron23')
makedepends=('gendesk' 'asar' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('28a7f5a08e7a63505158da5ac7d498e4eafefbfffbfdca183555d8f74f5f2225'
            '414f4514cab56763f5eb484240988d18a2dd2e6a83b1ff356a2cf2b2afe9dddc')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run electron:package
}
prepare() {
    asar pack "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-"*/resources/app "${srcdir}/${pkgname}.asar"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}