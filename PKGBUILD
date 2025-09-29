# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=1.32.2
_electronversion=33
_nodeversion=20
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
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('ebeff08870f74c7a769ddd94614e6333ab5231de888d80828688677acd17a431'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver="$(grep '^ *"electron": *"' "${srcdir}/${pkgname}-${pkgver}/package.json" | cut -d'"' -f4 | cut -d. -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _get_electron_version
    _ensure_local_nvm
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
    find {electron,src} -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname}\"/g" {} \;
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/logo\.icns/logo\.png/g" electron-builder.json
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     pnpm vite build
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} --config=electron-builder.json"
    ln -sf "/usr/bin/gnirehtet" "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra/linux-*/gnirehtet/gnirehtet
    ln -sf "/usr/bin/scrcpy" "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra/linux-*/scrcpy/scrcpy
    ln -sf "/usr/share/scrcpy/scrcpy-server" "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra/linux-*/scrcpy/scrcpy-server
    ln -sf "/usr/bin/adb" "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra/linux-*/scrcpy/adb
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron/resources/build/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
