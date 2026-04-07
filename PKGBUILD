# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=2.8.0
_electronversion=33
_nodeversion=24
pkgrel=1
pkgdesc="📱Graphical Scrcpy to display and control Android devices powered by Electron(Use system-wide electron).使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://escrcpy.viarotel.eu.org/"
_ghurl="https://github.com/viarotel-org/escrcpy"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'gnirehtet'
    'scrcpy'
    'android-tools'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'pnpm'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('fe91d4fb3887b16f6aa5a992337daa2ce195784cdebb77a672d3ee65650aa061'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname}-${pkgver}/desktop/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        export PNPM_LINK_WORKSPACE_PACKAGES=true
        export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
        export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
        export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_VIRTUAL_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_SHAMEFULLY_HOIST=true
        export PNPM_VIRTUAL_STORE_DIR_MAX_LENGTH=80
        export PNPM_NODE_LINKER=hoisted
        export PNPM_NETWORK_CONCURRENCY=32
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        }
    fi
    _ensure_local_nvm
    find desktop/{electron,src} -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname}\"/g" {} \;
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" desktop/package.json
    sed -i '
        s/logo\.icns/logo\.png/g
        s/AppImage/dir/g
        /target: '\''deb'\''/d
        /target: '\''flatpak'\''/d
    ' desktop/electron-builder.config.js
    case "${CARCH}" in
        aarch64)
            ln -sf "/usr/bin/adb" desktop/electron/resources/extra/linux-arm64/scrcpy/adb
            ln -sf "/usr/bin/fastboot" desktop/electron/resources/extra/linux-arm64/scrcpy/fastboot
            ln -sf "/usr/bin/scrcpy" desktop/electron/resources/extra/linux-arm64/scrcpy/scrcpy
            ln -sf "/usr/bin/adb" desktop/electron/resources/extra/linux-arm64/scrcpy/scrcpy
            ln -sf "/usr/share/scrcpy/scrcpy-server" desktop/electron/resources/extra/linux-arm64/scrcpy/scrcpy-server
        ;;
        x86_64)
            ln -sf "/usr/bin/adb" desktop/electron/resources/extra/linux-x64/scrcpy/adb
            ln -sf "/usr/bin/fastboot" desktop/electron/resources/extra/linux-x64/scrcpy/fastboot
            ln -sf "/usr/bin/gnirehtet" desktop/electron/resources/extra/linux-x64/gnirehtet/gnirehtet
            ln -sf "/usr/bin/scrcpy" desktop/electron/resources/extra/linux-x64/scrcpy/scrcpy
            ln -sf "/usr/share/scrcpy/scrcpy-server" desktop/electron/resources/extra/linux-x64/scrcpy/scrcpy-server
        ;;
    esac
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     pnpm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    case "${CARCH}" in
        aarch64)
            _os_aarch="linux-arm64-unpacked"
        ;;
        x86_64)
            _os_aarch="linux-unpacked"
        ;;
    esac
	find "${srcdir}/${pkgname}-${pkgver}/desktop/dist-release/${_os_aarch}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" {} +
    if find "${srcdir}/${pkgname}-${pkgver}/desktop/dist-release/${_os_aarch}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname}-${pkgver}/desktop/dist-release/${_os_aarch}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname}"
            fi
        done
    fi
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}/lib"
    ln -sf "/usr/lib/${pkgname}/app.asar.unpacked/node_modules/@img/sharp-libvips-linux-x64/lib/libvips-cpp.so.8.17.3" \
        "${pkgdir}/usr/lib/${pkgname}/lib/libvips-cpp.so.8.17.3"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/desktop/electron/resources/build/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
