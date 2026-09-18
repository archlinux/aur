# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
_appname=nuclear
pkgname="${_appname}-player"
_pkgname='Nuclear Player'
pkgver=1.48.4
_pnpmversion=12.0.0
_nodeversion=24
pkgrel=1
pkgdesc="Streaming music player that finds free music for you."
arch=('any')
url="https://nuclearplayer.com/"
_ghurl="https://github.com/nukeop/nuclear"
license=('AGPL-3.0-only')
depends=(
    'webkit2gtk-4.1'
    'libsoup3'
    'gtk3'
    'wavpack'
    'gst-plugins-good'
    'gst-plugins-base'
)
makedepends=(
    'pnpm'
    'nvm'
    'curl'
    'rustup'
)
optdepends=(
    'gst-plugins-bad: Additional media codec support'
    'gst-plugins-ugly: Patented codec support'
    'gst-libav: FFmpeg-based codec support'
)
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/player@${pkgver}.tar.gz")
sha256sums=('b766a2125460609f8e6187bfc02774dd4c98a3a7f7f66cadafe240f8bbb26c5d')
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
	export NODE_OPTIONS="--max-old-space-size=4096"
	export npm_config_node_options="--max-old-space-size=4096"
	mkdir -p "${PNPM_CACHE_DIR}" "${PNPM_STORE_DIR}" "${PNPM_GLOBAL_DIR}" "${PNPM_GLOBAL_BIN_DIR}" "${PNPM_STATE_DIR}"
	local _pnpmver="${_pnpmversion}"
	if [[ -z "${_pnpmver}" ]]; then
		_pnpmver="$(node -p "const pm=require('./package.json').packageManager; pm && pm.startsWith('pnpm@') ? pm.split('@')[1] : ''" 2>/dev/null)"
	fi
	if [[ -n "${_pnpmver}" ]]; then
		export COREPACK_HOME="${srcdir}/.corepack"
		install -dm755 "${srcdir}/.bin"
		corepack enable --install-directory "${srcdir}/.bin"
		export PATH="${srcdir}/.bin:${PATH}"
		corepack prepare "pnpm@${_pnpmver}" --activate
	fi
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
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    _set_build_env
    sed -i -e "
        s/Exec=nuclear-music-player/Exec=${pkgname}/g
        s/Icon=com.nuclearplayer.Nuclear/Icon=${pkgname}/g
    " packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.desktop
    sed -i "s/com.nuclearplayer.Nuclear/${pkgname}/g" packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.metainfo.xml
    sed -i -e "
        s/\"active\"\: true\,/\"active\"\: false\,/g
        s/${_appname}-music-player/${pkgname}/g
    " packages/player/src-tauri/tauri.conf.json
    NODE_ENV=development    pnpm add -D node-addon-api node-gyp
    NODE_ENV=development    pnpm install --no-frozen-lockfile
    rustup default stable
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    _set_build_env
    # Build all packages in the correct order
    for pkg in model website i18n themes hifi ui plugin-sdk storybook player; do
        msg2 "Building ${pkg}..."
        cd "${srcdir}/${pkgname}-${pkgver}/packages/${pkg}"
        echo y | NODE_ENV=production pnpm run build || {
            error "Failed to build ${pkg}"
            return 1
        }
    done
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
