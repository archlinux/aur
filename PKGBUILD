# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=favicon-generator
pkgver=0.1.1
pkgrel=3
pkgdesc="Small Electron based app to generate favicon in different formats."
arch=('any')
url="https://github.com/anthonypauwels/favicon-generator"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron14')
makedepends=('npm' 'nodejs' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('b379f24df4fceb2c3eb8aba66ee0cf43b80e2a59f7db5805317e4d4a1481a3b4'
            'aaba650c0bbfbfffd3df3de30515eae4e221378ec813e423414f2796f58a0b5e')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Graphics;Utility" --name "Favicon Generator" --exec "/opt/${pkgname%}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}