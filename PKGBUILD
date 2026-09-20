# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
_appname=nuclear
pkgname="${_appname}-player"
_pkgname='Nuclear Player'
pkgver=1.48.6
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
sha256sums=('fb7dc2721b96d2a9ce3b0296c3319ed96876cf5e5e2c5c2de3b5a9b39d2690d4')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
    export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export XDG_STATE_HOME="${srcdir}/.local/state"
	export PNPM_HOME="${srcdir}/.pnpm/bin"
	export pnpm_config_cache_dir="${srcdir}/.pnpm_cache"
	export pnpm_config_store_dir="${srcdir}/.pnpm_store"
	export pnpm_config_global_dir="${srcdir}/.pnpm/global"
	export pnpm_config_state_dir="${srcdir}/.pnpm/state"
	export pnpm_config_node_linker=hoisted
	export pnpm_config_minimum_release_age=0
	export pnpm_config_update_notifier=false
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${srcdir}/.corepack"
	mkdir -p "${HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
	export PATH="${PNPM_HOME}:${PATH}"
	export CARGO_HOME="${srcdir}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${CARGO_HOME}"
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
    export NODE_ENV=development
    pnpm add -D node-addon-api node-gyp
    pnpm install --no-frozen-lockfile
    rustup default stable
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    _set_build_env
    exportNODE_ENV=production
    # Build all packages in the correct order
    for pkg in model website i18n themes hifi ui plugin-sdk storybook player; do
        msg2 "Building ${pkg}..."
        cd "${srcdir}/${pkgname}-${pkgver}/packages/${pkg}"
        echo y | pnpm run build || {
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
