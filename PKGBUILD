# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ChatALL
pkgname=chatall
pkgver=1.85.110
_electronversion=33
_nodeversion=20
pkgrel=2
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, Bard, Alpaca, Vicuna, Claude, ChatGLM, MOSS, 讯飞星火, 文心一言 and more, discover the best answers(Use system-wide electron)"
arch=('any')
url="http://chatall.ai/"
_ghurl="https://github.com/sunner/ChatALL"
license=('Apache-2.0')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'python'
    'curl'
    'yarn'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('defa752ef937ee9fc3f12045fa6473fee53729b6f27b01de412ae0edc3a1432c'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
	export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
	export NPM_CONFIG_MAXSOCKETS=32
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
			export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
			export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
			export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
			export ELECTRON_BUILDER_BINARIES_MIRROR="https://npmmirror.com/mirrors/electron-builder-binaries/"
		}
		find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
	fi
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
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
    " -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i -e "
        s/\"AppImage\", \"deb\"/\"dir\"/g
        /builderOptions: {/a\        electronDist: \"/usr/lib/electron${_electronversion}\",
    " vue.config.js
    sed -i -e "
        s/--x64 --arm64//g
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
    " package.json
    NODE_ENV=development    npm install --legacy-peer-deps --ignore-scripts
    NODE_ENV=development    npm rebuild sharp --build-from-source
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     npm run release-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
