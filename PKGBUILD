# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=2.5.1
_electronversion=33
_nodeversion=22
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
sha256sums=('812a4105803297e656b94a3a48fffbbbd2378e79321f209c899890a36243cdc4'
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
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir=${srcdir}/.pnpm_cache"
        echo "store-dir=${srcdir}/.pnpm_store"
        echo "virtual-store-dir=${srcdir}/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
        echo "node-linker=hoisted"
        echo "network-concurrency=32"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    _ensure_local_nvm
    find desktop/{electron,src} -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname}\"/g" {} \;
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" desktop/package.json
    sed -i -e "
        s/logo\.icns/logo\.png/g
        s/AppImage/dir/g
        s/deb/dir/g
    " desktop/electron-builder.config.js
    case "${CARCH}" in
        aarch64)
            ln -sf "/usr/bin/adb" desktop/electron/resources/extra/linux-arm64/scrcpy/scrcpy
        ;;
        x86_64)
            ln -sf "/usr/bin/gnirehtet" desktop/electron/resources/extra/linux-x64/gnirehtet/gnirehtet
            ln -sf "/usr/bin/scrcpy" desktop/electron/resources/extra/linux-x64/scrcpy/scrcpy
            ln -sf "/usr/bin/adb" desktop/electron/resources/extra/linux-x64/scrcpy/adb
            ln -sf "/usr/share/scrcpy/scrcpy-server" desktop/electron/resources/extra/linux-x64/scrcpy/scrcpy-server
        ;;
    esac
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     pnpm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	find "${srcdir}/${pkgname}-${pkgver}/desktop/dist-release/linux-"*"/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" {} +
    if find "${srcdir}/${pkgname}-${pkgver}/desktop/dist-release/linux-"*"/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname}-${pkgver}/desktop/dist-release/linux-"*"/resources/"*; do
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