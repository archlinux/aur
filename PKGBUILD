# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=grist-desktop
_pkgname='Grist Desktop'
_debname=com.getgrist.grist
pkgver=0.3.15
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
    'curl'
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
sha256sums=('7634068ba91be8a5e906b79e35f595fc7d442269ec782a97c5553971fe12d0eb'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	_ev="$(electron${_electronversion} -v)"
	export SYSTEM_ELECTRON_VERSION="${_ev#v}"
	export HOME="${srcdir}/.electron-gyp"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export npm_config_platform=linux
	export npm_config_arch="${CARCH}"
	export NODE_OPTIONS="--max-old-space-size=4096"
	export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
	export YARN_NETWORK_CONCURRENCY=32
	local _yarnver _yarnmajor=0
	_yarnver="$(node -p "require('./package.json').packageManager?.split('@')[1]?.split('-')[0] || ''" 2>/dev/null)"
	_yarnmajor="${_yarnver%%.*}"
	_yarnmajor="${_yarnmajor:-0}"
	if [[ "${_yarnmajor}" -ge 2 ]] 2>/dev/null || [[ -f .yarnrc.yml ]]; then
		export XDG_STATE_HOME="${srcdir}/.local/state"
		export YARN_ENABLE_GLOBAL_CACHE=false
		export YARN_ENABLE_MIRROR=false
		export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/berry"
		export YARN_NODE_LINKER=node-modules
		export YARN_NM_MODE=hardlinks-local
		export YARN_ENABLE_TELEMETRY=false
		export YARN_ENABLE_SCRIPTS=true
		export YARN_ENABLE_IMMUTABLE_INSTALLS=false
		export YARN_ENABLE_PROGRESS_BARS=false
		export YARN_ENABLE_COLORS=false
		export YARN_HTTP_TIMEOUT=600000
		export YARN_HTTP_RETRY=5
		export COREPACK_HOME="${srcdir}/.corepack"
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}"
		install -dm755 "${srcdir}/.bin"
		corepack enable --install-directory "${srcdir}/.bin"
		export PATH="${srcdir}/.bin:${PATH}"
		corepack prepare "yarn@${_yarnver}" --activate
	else
		export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
		export YARN_LINK_FOLDER="${srcdir}/.yarn/link"
		export YARN_TEMP_FOLDER="${srcdir}/.yarn/tmp"
		export YARN_NETWORK_TIMEOUT=600000
		export YARN_CHILD_CONCURRENCY="$(nproc)"
		export YARN_FROZEN_LOCKFILE=true
		export YARN_NONINTERACTIVE=true
		export YARN_NO_PROGRESS=true
		export YARN_IGNORE_ENGINES=true
		export NODE_ENV=production
		export YARN_PRODUCTION=false
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${YARN_LINK_FOLDER}" "${YARN_TEMP_FOLDER}"
	fi
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
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
    _set_build_env
    _ensure_local_nvm
    sed -i "s/Icon=${_debname}/Icon=${pkgname}/g" "metadata/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname}/g" "metadata/${_debname}-mime.xml"
    sed -i "s/${_debname}/${pkgname}/g" "metadata/${_debname}.metainfo.xml"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" ext/package.json
    git submodule update --depth=1 --init --recursive
    rm -rf "${srcdir}/${pkgname}-${pkgver}/core/python" "${srcdir}/${pkgname}-${pkgver}/core/cpython.tar.gz"
    NODE_ENV=development    yarn install
    NODE_ENV=development    yarn upgrade sqlite3
    NODE_ENV=development    yarn run setup
}
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/core/static/icons/grist.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/metadata/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/metadata/${_debname}-mime.xml" "${pkgdir}/usr/share/mime/application/${pkgname}.xml"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/metadata/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
