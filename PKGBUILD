# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moekoemusic
_pkgname='MoeKoe Music'
_zhsname='萌音'
pkgver=1.6.2
_electronversion=39
_nodeversion=22
pkgrel=1
pkgdesc="An open-source, concise, and aesthetically pleasing third-party client for KuGou.(Use system-wide electron)一款开源简洁高颜值的酷狗第三方客户端"
arch=(
    'aarch64'
    'x86_64'
)
url="https://music.moekoe.cn/"
_ghurl="https://github.com/iAJue/MoeKoeMusic"
license=('GPL-2.0-only')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'pnpm'
    'nvm'
    'git'
    'curl'
    'gendesk'
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
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U" \
        --custom=Name[zh_CN]="${_zhsname}"
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
    sed -i -e "
        s/icon\.ico/icon\.png/g
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g
        s/\.\.\/api/\.\/api/g
    " "${srcdir}/${pkgname}-${pkgver}/electron/appServices.js"
    NODE_ENV=development    npm install
    cd "${srcdir}/${pkgname}-${pkgver}/api"
    NODE_ENV=development    npm install
}
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
	local electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    NODE_ENV=production     npm run build
    case "${CARCH}" in
        aarch64)
            NODE_ENV=production     npm run build:api:linux-aarch64
            ;;
        x86_64)
            NODE_ENV=production     npm run build:api:linux
            ;;
    esac
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -a "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-"*"/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-"*/{api,assets} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
