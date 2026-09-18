# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rayburst-git
_pkgname=Rayburst
pkgver=4.0.0.beta.2.r0.ga6ae651
_nodeversion=24
pkgrel=1
pkgdesc="Redefining the open-source download manager."
arch=('any')
url="https://rayburst.pages.dev/"
_ghurl="https://github.com/AnInsomniacy/rayburst"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
)
makedepends=(
    'nvm'
    'git'
    'rustup'
    'pnpm'
    'gendesk'
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
	export HOME="${srcdir}/.home"
	export CARGO_HOME="${srcdir}/.cargo"
	export CARGO_NET_OFFLINE=false
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_BUILD_JOBS="$(nproc)"
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	export CARGO_PROFILE_RELEASE_DEBUG=0
	mkdir -p "${HOME}" "${CARGO_HOME}"
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
    cd "${srcdir}/${pkgname//-/.}"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    rustup default stable
    sed -i 's/"active": true,/"active": false,/g' src-tauri/tauri.conf.json
    cp src-tauri/icons/128x128@2x.png src-tauri/icons/256x256.png
    NODE_ENV=development    pnpm install
}
build() {
	cd "${srcdir}/${pkgname//-/.}"
    NODE_ENV=production     pnpm run tauri build
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/"{aria2-next,"${pkgname%-git}","${pkgname%-git}-browser-launcher"} -t "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -a "${srcdir}/${pkgname//-/.}/src-tauri/target/release/data" "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/icons/${_icons}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
