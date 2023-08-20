# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ih8rtcgui
pkgver=0.0.4
pkgrel=1
pkgdesc="RTC Jazz (EWM) simple desktop application to manage/view workitems"
arch=('x86_64')
url="https://github.com/kenny59/ih8rtcgui"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('c0774e5ff3cd71c9e3c351ac1994fb4d55a8964ef0515882b81cac8354ebb01c'
            '83fcc58365d5e646cc1a069e348daf095b8913f71c936a93f2b0d00845e5c93d')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|--win|--linux|g" -i package.json
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    asar pack "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked//LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}