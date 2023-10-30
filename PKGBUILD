# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=1.11.2
pkgrel=1
pkgdesc="使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动"
arch=('aarch64' 'x86_64')
url="https://github.com/viarotel-org/escrcpy"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron27'
    'scrcpy'
)
makedepends=(
    'gendesk'
    'npm>=9.8.1'
    'nodejs>=18.18.0'
)
source=(
    "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh"
)
sha256sums=('6a2f86e9d4735b4833576bc416cbfbaae5d141132e7a2f36e5ad844f9efe2029'
            '941cb7196d03283a6e65a2271f0c8381a9ec8176f38ce9dc9916f3f89b29a720')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '81,84d' -i electron-builder.json
    npm install
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    if [ "${CARCH}" == "aarch64" ];then
        _os_architecture=linux-arm64-unpacked
    elif [ "${CARCH}" == "x86_64" ];then
        _os_architecture=linux-unpacked
    fi
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/${_os_architecture}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/${_os_architecture}/resources/extra/common/tray/icon.png" \
        -t "${pkgdir}/usr/lib/${pkgname%-bin}/extra/common/tray"
    cd "${srcdir}/${pkgname}-${pkgver}/dist-release/${_os_architecture}/resources/extra/linux"
    chmod 755 android-platform-tools/{adb,etc1tool,fastboot,hprof-conv,make_f2fs,make_f2fs_casefold,mke2fs,sqlite3} \
              gnirehtet/gnirehtet
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist-release/${_os_architecture}/resources/extra/linux" "${pkgdir}/usr/lib/${pkgname%-bin}/extra"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/assets/logo-298bebc1.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}