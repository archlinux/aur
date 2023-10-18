# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=1.6.10
pkgrel=1
pkgdesc="使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动"
arch=('any')
url="https://github.com/viarotel-org/escrcpy"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26' 'scrcpy')
makedepends=('gendesk' 'npm>=9.8.1' 'nodejs>=18.18.0')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('235a4c02940ec458a926902ad50c4c397da74343b28f3f2f3143de396be16c8f'
            '56ec78aeb841bb4c6d5c40893aff43a8a034bc4371684bc6a58404e6c8f45368')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-unpacked/resources/extra/core/"* \
        -t "${pkgdir}/opt/${pkgname}/resources/extra/core"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-unpacked/resources/extra/core/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
