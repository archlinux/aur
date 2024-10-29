# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy
pkgver=1.25.3
_electronversion=33
_nodeversion=20
pkgrel=1
pkgdesc="📱 Graphical Scrcpy to display and control Android, devices powered by Electron.Use system-wide electron.使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/viarotel-org/escrcpy"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'scrcpy'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'pnpm'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('2241dcabb4c12e333eb51a8be0d7c9139af03f0b1f86066bf73fdc880efb9c78'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    find {electron,src} -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/" {} \;
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/;s/--linux/-l --dir/" package.json
    sed "s/logo\.icns/logo\.png/" -i electron-builder.json
    NODE_ENV=development    pnpm install
    NODE_ENV=production     pnpm vite build
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra/linux
    chmod 755 android-platform-tools/{adb,etc1tool,fastboot,hprof-conv,make_f2fs,make_f2fs_casefold,mke2fs,sqlite3} \
              gnirehtet/gnirehtet
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/dist-release/linux-"*/resources/extra "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron/resources/build/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
