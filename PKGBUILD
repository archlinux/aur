# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Zaoqi
pkgname=electerm
pkgver=3.1.26
_electronversion=38
_nodeversion=22
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
    'jq'
)
source=("${pkgname}.sh")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname}-${pkgver}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}"
    git clone \
        --depth 1 \
        --branch "v${pkgver}" \
        "${_ghurl}" \
        "${pkgname}-${pkgver}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm add -D node-gyp
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
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
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	find "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*"/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" {} +
    if find "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*"/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*"/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/node_modules/@${pkgname}/${pkgname}-resource/build-res/appx/StoreLogo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}