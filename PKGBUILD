# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=losslesscut-git
_pkgname=LosslessCut
_appname="no.mifi.${pkgname%-git}"
pkgver=3.69.0.r108.gaa498c3
_electronversion=42
_nodeversion=22
pkgrel=1
pkgdesc="The swiss army knife of lossless video/audio editing.Using system-wide ffmpeg.(Use system-wide electron)"
arch=('x86_64')
url="https://losslesscut.app/"
_ghurl="https://github.com/mifi/lossless-cut"
license=('GPL-2.0-only')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
makedepends=(
    'git'
    'nvm'
    'npm'
    'gcc'
    'curl'
    'yarn'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
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
	export XDG_STATE_HOME="${srcdir}/.local/state"
	export YARN_ENABLE_GLOBAL_CACHE=false
	export YARN_ENABLE_MIRROR=false
	export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
	export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/berry"
	export YARN_NODE_LINKER=node-modules
	export YARN_NM_MODE=hardlinks-local
	export YARN_ENABLE_TELEMETRY=false
	export YARN_ENABLE_SCRIPTS=true
	export YARN_ENABLE_IMMUTABLE_INSTALLS=true
	export YARN_ENABLE_PROGRESS_BARS=false
	export YARN_ENABLE_COLORS=false
	export YARN_NETWORK_CONCURRENCY=32
	export YARN_HTTP_TIMEOUT=600000
	export YARN_HTTP_RETRY=5
	export npm_config_platform=linux
	export npm_config_arch="${CARCH}"
	export NODE_OPTIONS="--max-old-space-size=4096"
	export COREPACK_HOME="${srcdir}/.corepack"
	mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}"
}
_use_new_yarn() {
	local _yarnver
	_yarnver="$(node -p "require('./package.json').packageManager?.split('@')[1] || ''")"
	if [[ -z "${_yarnver}" ]]; then
		error "package.json 中未找到 packageManager 字段（应形如 \"yarn@4.x\"）"
		return 1
	fi
	export COREPACK_HOME="${srcdir}/.corepack"
	install -dm755 "${srcdir}/.bin"
	corepack enable --install-directory "${srcdir}/.bin"
	export PATH="${srcdir}/.bin:${PATH}"
	corepack prepare "yarn@${_yarnver}" --activate
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _set_build_env
    _ensure_local_nvm
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -e "
        s/\/app\/bin\/run.sh/${pkgname%-git}/g;
        s/${_appname}/${pkgname%-git}/g
    " -i "${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-git}/g" "${_appname}.appdata.xml"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    _use_new_yarn
    NODE_ENV=development    yarn add node-gyp
    NODE_ENV=development    yarn install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-git}/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${pkgdir}/usr/lib/${pkgname%-git}/ffprobe"
    install -Dm644 "${srcdir}/${pkgname//-/.}/icon-build/app-512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-git}.appdata.xml"
}