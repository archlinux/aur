# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=1.18.4
_electronversion=27
_nodeversion=20
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
)
makedepends=(
    'gendesk'
    'npm'
    'yarn'
    'nvm'
    'curl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('5b8b6b3544c26d4957622e2d4240699eb0e04c1c38e6d67457fec86cf61c23d7'
            '05762c556c85a4423b28600ccbbe7b7dcdd3d1be526ef4a588a510671fa6c62a')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    rm -rf dist_release node_modules
    sed "s|--linux|-l --dir|g" -i package.json
    sed "s|logo.icns|logo.png|g" -i electron-builder.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra/linux
    chmod 755 android-platform-tools/{adb,etc1tool,fastboot,hprof-conv,make_f2fs,make_f2fs_casefold,mke2fs,sqlite3} \
              gnirehtet/gnirehtet
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron/resources/build/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}