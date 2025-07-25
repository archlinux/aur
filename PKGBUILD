# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Zaoqi
pkgname=electerm
pkgver=1.100.30
_electronversion=30
_nodeversion=20
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client.(Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://electerm.html5beta.com/"
_ghurl="https://github.com/electerm/electerm"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'python-setuptools'
    'curl'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('72c2523d63f9a610ad023dfd8eca709beb3b3dae05a0f49cca18757db9fe27ab'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm add -D node-gyp
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm run clean
    NODE_ENV=production     npm run compile
    NODE_ENV=production     npm run prepare-file
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config electron-builder.json"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/{android-*,darwin-*,win32-*}
    rm -rf "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar.unpacked/node_modules/font-list/libs/{darwin,win32}
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/{linux-arm,linux-x64}
            ;;
        armv7h)
            rm -rf "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/{linux-arm64,linux-x64}
            ;;
        x86_64)
            rm -rf "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/linux-arm*
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/node_modules/@${pkgname}/${pkgname}-resource/build-res/appx/StoreLogo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
