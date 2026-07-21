# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Jacqueline Fisher <jcfisher@reality-overwritten.net>
pkgname=postybirb
_pkgname=PostyBirb
pkgver=4.0.43
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly.(Use system-wide electron)"
arch=('any')
url="https://www.postybirb.com/"
_ghurl="https://github.com/mvdicarlo/postybirb"
license=('BSD-3-Clause')
provides=("${pkgname}")
conflicts=(
    "${pkgname}"
    "${pkgname}-plus"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'yarn'
    'nvm'
    'gendesk'
    'curl'
    'git'
    'jq'
)
source=("${pkgname}.sh")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export YARN_NPM_REGISTRY_SERVER="https://registry.npmmirror.com"
            export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
            export YARN_HTTP_RETRY=3
            export YARN_HTTP_TIMEOUT=10000
        }
    fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}"
    if [[ ! -d "${pkgname}-${pkgver}" ]]; then
        git clone \
            --depth 1 \
            --branch "v${pkgver}" \
            "${_ghurl}" \
            "${pkgname}-${pkgver}"
    fi
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/\/packages//g" electron-builder.yml
    _yarnver=`grep "yarn@" package.json | awk '{print $2}' | sed "s/\"//g;s/yarn@//g;s/,//g"`
    corepack enable yarn
    sed -i "s/\"version\": \"[^\"]*\"/\"version\": \"${_yarnver}\"/g" package.json
    NODE_ENV=development    yarn add -D node-addon-api
    NODE_ENV=development    yarn install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     yarn run build:prod
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config electron-builder.yml
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packaging-resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
