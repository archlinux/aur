# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oba-live-tool-git
pkgver=1.6.1.r24.g47c8b67
_electronversion=36
_nodeversion=22
_pnpmversion=10
pkgrel=1
pkgdesc="Douyin Store / Jiumian Baiying / Douyin Group Buying / Xiaohongshu / Video Account / Kuaishou Store / Taobao Live Streaming Tools."
arch=('any')
url="https://github.com/qiutongxue/oba-live-tool"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nvm'
    'git'
    'curl'
    'pnpm'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${url}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
	mkdir -p "${HOME}"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export XDG_STATE_HOME="${srcdir}/.local/state"
	export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
	export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
	export PNPM_GLOBAL_DIR="${srcdir}/.pnpm/global"
	export PNPM_GLOBAL_BIN_DIR="${srcdir}/.pnpm/bin"
	export PNPM_STATE_DIR="${srcdir}/.pnpm/state"
	export PNPM_MINIMUM_RELEASE_AGE=0
	export PNPM_NODE_LINKER=hoisted
	export PNPM_FETCH_RETRIES=3
	export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
	export PNPM_UPDATE_NOTIFIER=false
	export PNPM_NO_COLOR=true
	export PNPM_NO_PROGRESS=true
	export pnpm_config_platform=linux
	export pnpm_config_arch="${CARCH}"
	export COREPACK_HOME="${srcdir}/.corepack"
	export NODE_OPTIONS="--max-old-space-size=4096"
	export npm_config_node_options="--max-old-space-size=4096"
	mkdir -p "${PNPM_CACHE_DIR}" "${PNPM_STORE_DIR}" "${PNPM_GLOBAL_DIR}" "${PNPM_GLOBAL_BIN_DIR}" "${PNPM_STATE_DIR}"
	local _pnpmver="${_pnpmversion}"
	if [[ -z "${_pnpmver}" ]]; then
		local _pm
		_pm="$(node -p "require('./package.json').packageManager || ''" 2>/dev/null)"
		[[ "${_pm}" == pnpm@* ]] && _pnpmver="${_pm#pnpm@}"
	fi
	if [[ -n "${_pnpmver}" ]]; then
		export COREPACK_HOME="${srcdir}/.corepack"
		install -dm755 "${srcdir}/.bin"
		corepack enable --install-directory "${srcdir}/.bin"
		export PATH="${srcdir}/.bin:${PATH}"
		corepack prepare "pnpm@${_pnpmver}" --activate
	fi
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/favicon.ico/favicon.png/g" electron/main/index.ts
    sed -i -e "
        s/chrome.exe/google-chrome-stable/g
        s/msedge.exe/microsoft-edge-stable/g
    " src/pages/SettingsPage/components/BrowserSetting.tsx
    sed -i -e "
        s/chrome.exe/google-chrome-stable/g
        s/msedge.exe/microsoft-edge-stable/g
    " electron/main/ipc/browser.ts
    sed -i -e "
        s/macConfig/linuxConfig/g
        s/darwin/linux/g
        s/\/Applications\/Microsoft Edge.app\/Contents\/MacOS\/Microsoft Edge/\/usr\/bin\/microsoft-edge-stable/g
        s/\/Applications\/Google Chrome.app\/Contents\/MacOS\/Google Chrome/\/usr\/bin\/google-chrome-stable/g
        s/name\: \'Microsoft Edge\',/name\: \'microsoft-edge-stable\',/g
        s/name\: \'Google Chrome\',/name\: \'google-chrome-stable\',/g
    " electron/main/utils/checkChrome.ts
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/\/\${version}//g" electron-builder.json
    NODE_ENV=production     pnpm -c tsc
    NODE_ENV=production     pnpm -c vite build
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.json"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/public/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
