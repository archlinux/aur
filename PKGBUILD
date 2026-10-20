# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
_appname=nuclear
pkgname="${_appname}-player"
_pkgname='Nuclear Player'
_debname="com.${pkgname//-/}.Nuclear"
pkgver=1.51.2
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
    'rustup'
    'jq'
)
optdepends=(
    'gst-plugins-bad: Additional media codec support'
    'gst-plugins-ugly: Patented codec support'
    'gst-libav: FFmpeg-based codec support'
)
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/player@${pkgver}.tar.gz")
sha256sums=('96d63fff34fbe5b0b04e9af5af86548bee28eff985ee3a24d3c958d0bf20fc32')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_project_dir() {
    find "${srcdir}" -name "src-tauri" -type d ! -path "*/node_modules/*" 2>/dev/null | \
        while read -r tauri_dir; do
            [ -f "${tauri_dir}/Cargo.toml" ] || continue
            local dir="${tauri_dir}"
            until [ -f "${dir}/package.json" ] || [ "$dir" = "${srcdir}" ] || [ "$dir" = "/" ]; do
                dir="$(dirname "$dir")"
            done
            [ -f "${dir}/package.json" ] && { echo "$dir"; return; }
        done
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
	export XDG_STATE_HOME="${HOME}/.local/state"
	export PNPM_HOME="${HOME}/.pnpm/bin"
	export pnpm_config_cache_dir="${HOME}/.pnpm_cache"
	export pnpm_config_store_dir="${HOME}/.pnpm_store"
	export pnpm_config_global_dir="${HOME}/.pnpm/global"
	export pnpm_config_state_dir="${HOME}/.pnpm/state"
	export pnpm_config_node_linker=hoisted
	export pnpm_config_minimum_release_age=0
	export pnpm_config_update_notifier=false
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
    export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${CARGO_HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
	export PATH="${PNPM_HOME}:${PATH}"
	local _pnpmver=""
	local _pkgjson="$(_get_project_dir)/package.json"
	if [ -f "${_pkgjson}" ]; then
		_pnpmver="$(grep -o '"packageManager"[^,]*' "${_pkgjson}" 2>/dev/null | grep -oE 'pnpm@[^"+]+' | head -n1 | sed 's/^pnpm@//')"
		if [ -z "${_pnpmver}" ]; then
			_pnpmver="$(grep -oE '"pnpm"[[:space:]]*:[[:space:]]*"[^"]+"' "${_pkgjson}" 2>/dev/null | grep -oE '[0-9][0-9.]*' | head -n1)"
		fi
	fi
	if [ -n "${_pnpmver}" ]; then
		npm install -g "pnpm@${_pnpmver}" --prefix "${HOME}/.pnpm" \
			--registry "${COREPACK_NPM_REGISTRY}"
	fi
}
prepare() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    sed -i -e "
        s/Exec=nuclear-music-player/Exec=${pkgname}/g
        s/Icon=${_debname}/Icon=${pkgname}/g
    " "packages/player/src-tauri/resources/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname}/g" "packages/player/src-tauri/resources/${_debname}.metainfo.xml"
    jq -r '
        .bundle.active = false |
        .mainBinaryName = "'"${pkgname}"'"
    ' packages/player/src-tauri/tauri.conf.json > tmp.json && mv tmp.json packages/player/src-tauri/tauri.conf.json
    rustup update stable
    rustup default stable
    export NODE_ENV=development
    pnpm add -D node-addon-api node-gyp
    pnpm install --no-frozen-lockfile
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    for pkg in model website i18n themes hifi ui plugin-sdk storybook player; do
        msg2 "Building ${pkg}..."
        cd "$(_get_project_dir)/packages/${pkg}"
        echo y | pnpm run build || {
            error "Failed to build ${pkg}"
            return 1
        }
    done
}
package() {
    local _appdir="$(_get_project_dir)/packages/player/src-tauri"
    install -Dm755 "${_appdir}/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${_appdir}/resources/${_debname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${_appdir}/resources/${_debname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
    _icon_sizes=(32x32 64x64 128x128 256x256 512x512)
	for _icons in "${_icon_sizes[@]}";do
		install -Dm644 "$(_get_project_dir)/flatpak/icons/${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
	done
}
