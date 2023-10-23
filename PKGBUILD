# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=1.8.16
pkgrel=1
pkgdesc="使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动"
arch=('aarch64' 'x86_64')
url="https://github.com/viarotel-org/escrcpy"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron27' 'scrcpy' 'android-sdk-platform-tools')
makedepends=('gendesk' 'npm>=9.8.1' 'nodejs>=18.18.0')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('6fc897c21f2e3d6f18534958965005e04ca597c754999613a7814fa7003c2d84'
            '95b1863c49ed526e664d14fcb4cfe30be5f4f581dc60903a7421a91354ff3a61')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '80,83d' -i electron-builder.json
    npm install
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    if [ "${CARCH}" == "aarch64" ];then
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-arm64-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-arm64-unpacked/resources/extra/"*.png \
            -t "${pkgdir}/opt/${pkgname}/resources/extra"
    elif [ "${CARCH}" == "x86_64" ];then
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-unpacked/resources/extra/"*.png \
            -t "${pkgdir}/opt/${pkgname}/resources/extra"
    fi
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}