# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=grist-desktop
_pkgname='Grist Desktop'
_debname=com.getgrist.grist
pkgver=0.3.16
_electronversion=41
_nodeversion=22
pkgrel=1
pkgdesc="A modern relational spreadsheet. It combines the flexibility of a spreadsheet with the robustness of a database."
arch=('any')
url="https://github.com/gristlabs/grist-desktop"
license=('Apache-2.0')
depends=(
    "electron${_electronversion}"
    'python-colorama'
    'python-lxml'
    'python-gobject'
    'python-typing_extensions'
    'python-tornado'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'yarn'
    'jq'
)
options=(
    '!strip'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('8cb19208c1771963642f12911d4abd2cc8695066dbbc5d2e626d25a4e5af5f9d'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export YARN_CACHE_FOLDER="${HOME}/.yarn/cache"
	export YARN_NETWORK_CONCURRENCY=32
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}"
	local _yarnver _yarnmajor=0
	_yarnver="$(node -p "require('./package.json').packageManager?.split('@')[1]?.split('-')[0] || ''" 2>/dev/null)"
	_yarnmajor="${_yarnver%%.*}"
	_yarnmajor="${_yarnmajor:-0}"
	if [[ "${_yarnmajor}" -ge 2 ]] 2>/dev/null || [[ -f .yarnrc.yml ]]; then
		export XDG_STATE_HOME="${HOME}/.local/state"
		export YARN_ENABLE_GLOBAL_CACHE=false
		export YARN_ENABLE_MIRROR=false
		export YARN_GLOBAL_FOLDER="${HOME}/.yarn/berry"
		export YARN_NODE_LINKER=node-modules
		export YARN_NM_MODE=hardlinks-local
		export YARN_ENABLE_TELEMETRY=false
		export YARN_ENABLE_SCRIPTS=true
		export YARN_HTTP_TIMEOUT=600000
		export YARN_HTTP_RETRY=5
		export YARN_NPM_REGISTRY_SERVER="${YARN_NPM_REGISTRY_SERVER:-${NPM_CONFIG_REGISTRY:-https://registry.yarnpkg.com}}"
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${COREPACK_HOME}"
	else
		export YARN_GLOBAL_FOLDER="${HOME}/.yarn/global"
		export YARN_LINK_FOLDER="${HOME}/.yarn/link"
		export YARN_TEMP_FOLDER="${HOME}/.yarn/tmp"
		export YARN_NETWORK_TIMEOUT=600000
		export YARN_CHILD_CONCURRENCY="$(nproc)"
		export YARN_FROZEN_LOCKFILE=true
		export YARN_IGNORE_ENGINES=true
		export YARN_PRODUCTION=false
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${YARN_LINK_FOLDER}" "${YARN_TEMP_FOLDER}" "${COREPACK_HOME}"
	fi
	local _reg="${NPM_CONFIG_REGISTRY:-https://registry.yarnpkg.com}"
	_reg="${_reg%/}"
	if [[ -f .yarnrc ]]; then
		sed -i "s|^registry .*|registry \"${_reg}\"|" .yarnrc
	fi
	if [[ -f yarn.lock ]] && grep -q 'resolved "https://registry.yarnpkg.com' yarn.lock; then
		sed -i "s|https://registry.yarnpkg.com/|${_reg}/|g" yarn.lock
	fi
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -v '^$' | sed 's/^[^0-9]*//' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/Icon=${_debname}/Icon=${pkgname}/g" "metadata/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname}/g" "metadata/${_debname}-mime.xml"
    sed -i "s/${_debname}/${pkgname}/g" "metadata/${_debname}.metainfo.xml"
    sed -i '/"devDependencies":/{:a;N;/^[[:space:]]*}/!ba;s/"electron": "[^"]*"/"electron": "'${SYSTEM_ELECTRON_VERSION}'"/}' package.json
    git submodule update --depth=1 --init --recursive
    rm -rf "$(_get_project_dir)/core/"{python,cpython.tar.gz}
    export NODE_ENV=development
	yarn install
    yarn upgrade sqlite3
    yarn run setup
}
build() {
	cd "$(_get_project_dir)"
    _set_build_env
    _ensure_local_nvm
    export NODE_ENV=production
	yarn run build
    yarn electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname}/"
	local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/core/static/icons/grist.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${_src}/metadata/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${_src}/metadata/${_debname}-mime.xml" "${pkgdir}/usr/share/mime/application/${pkgname}.xml"
    install -Dm644 "${_src}/metadata/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
    install -Dm644 "${_src}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
