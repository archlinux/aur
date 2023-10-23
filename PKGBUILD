# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=1.8.15
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
sha256sums=('183669f89da070e877119ebba6bc69a642fa592c9e4f8e0e70168af887ad757a'
            '56ec78aeb841bb4c6d5c40893aff43a8a034bc4371684bc6a58404e6c8f45368')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '80,83d' -i electron-builder.json
    npm install
    npm run build:linux
    cp "${srcdir}/${pkgname}-${pkgver}/dist-release/.icon-set/logo_512.png" "${srcdir}/${pkgname}-${pkgver}/dist-release/icon_512x512.png"
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
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}