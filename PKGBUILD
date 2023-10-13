# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ih8rtcgui
pkgver=0.0.4
pkgrel=2
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
            '8d67092299d436ef7dbb79d54821cac1f03e0f94b1737b5cc51dda8264eb61cc')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|--win|--linux AppImage|g" -i package.json
    npm i
    npm run build
    asar pack "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked//LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}