# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=1.16.3
_electronversion=27
pkgrel=1
pkgdesc="使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/viarotel-org/escrcpy"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'scrcpy'
)
makedepends=(
    'gendesk'
    'npm>=9.8.1'
    'nodejs>=18.18.0'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -e '81,84d' -e 's|"deb"|"AppImage"|g' -i electron-builder.json
    npm install
    npm run build:linux
    cp dist-release/.icon-set/logo_1024.png dist-release/.icon-set/icon_1024x1024.png
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
        -t "${pkgdir}/usr/lib/${pkgname}/extra/common/tray"
    cd "${srcdir}/${pkgname}-${pkgver}/dist-release/${_os_architecture}/resources/extra/linux"
    chmod 755 android-platform-tools/{adb,etc1tool,fastboot,hprof-conv,make_f2fs,make_f2fs_casefold,mke2fs,sqlite3} \
              gnirehtet/gnirehtet
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist-release/${_os_architecture}/resources/extra/linux" "${pkgdir}/usr/lib/${pkgname}/extra"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/.icon-set/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}