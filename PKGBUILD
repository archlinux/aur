# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=favicon-generator
pkgver=0.1.1
pkgrel=4
pkgdesc="Small Electron based app to generate favicon in different formats."
arch=('any')
url="https://github.com/anthonypauwels/favicon-generator"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron14')
makedepends=('npm>=9.0.0' 'nodejs>=18.0.0' 'gendesk' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('b379f24df4fceb2c3eb8aba66ee0cf43b80e2a59f7db5805317e4d4a1481a3b4'
            '8d0ddb62abb52100841258e8b83aa62945bf3f9108e4d3315075f0249817f441')
prepare() {
    gendesk -f -n -q --categories "Graphics;Utility" --name "Favicon Generator" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run build
    asar e "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}