# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bot.dev
pkgver=0.0.2
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
sha256sums=('5a1dd5687b9bf11bef1ddff2d29b65c64da2dafc35c5fec77edf3303d6f90b56'
            'abaaa4b6c61773d0fff4c40124604acff0ae7218ef17a1ffc4637ed39ae5373c')
prepare() {
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run electron:package
    asar pack "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-"*/resources/app "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}