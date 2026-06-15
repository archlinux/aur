# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=tailchat
pkgname="${_pkgname}-desktop"
pkgver=1.11.11
_electronversion=18
_nodeversion=16
pkgrel=1
pkgdesc="Next generation noIM application in your own workspace, not only another Slack/Discord/Rocket.chat.(Use system-wide electron)"
arch=('any')
url="https://tailchat.msgbyte.com/"
_ghurl="https://github.com/msgbyte/tailchat"
license=('Apache-2.0')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'pnpm'
    'git'
    'curl'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('1a710b43c3495ba044a3330bc464e7826c04d47b0d7281eeb176028ce21b32f8'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${_pkgname}-desktop" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}/client/desktop"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	local HOME="${srcdir}/.electron-gyp"
	mkdir -p "${srcdir}/.electron-gyp"
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export YARN_REGISTRY="https://registry.npmmirror.com"
			export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
			export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
			export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
			export YARN_PLUGINS_FOLDER="${srcdir}/.yarn/plugins"
			export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
			export YARN_USE_HARDLINKS=true
			# export YARN_BUILD_FROM_SOURCE=true
			export YARN_LINK_WORKSPACE_PACKAGES=true
			export YARN_FETCH_RETRIES=3
			export YARN_FETCH_RETRY_TIMEOUT=10000
			export YARN_NETWORK_CONCURRENCY=32
		}
		find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
	fi
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} \;
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/\/build//g" -i electron-builder.yml
    NODE_ENV=development    yarn install
    NODE_ENV=development    yarn add -D ts-node source-map-support
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/client/desktop"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     yarn ts-node ./.erb/scripts/clean.js dist
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config.asar=false
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/client/desktop/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
