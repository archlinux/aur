# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bili-music
_pkgname='Bili Music'
_zhsname='午夜黑胶'
pkgver=1.1.0
_nodeversion=22
pkgrel=1
pkgdesc="A no login, no disk B station music player. Use Bilibili as your music library, listen to music without login, do not have to download.一个免登录、不落盘的 B 站音乐播放器。把哔哩哔哩当作你的曲库，听歌不必登录，不必下载。"
arch=('any')
url="https://github.com/Jmiao11/bili-music"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
	'libappindicator'
)
makedepends=(
	'git'
	'rustup'
	'gendesk'
	'librsvg'
	'npm'
	'nvm'
	'jq'
)
options=(
	'!lto'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('a6167a3f7a3a7d9cf68235eb64489f2eb0068462d57d74d58a76cb4e08dc342c')
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
_get_app_dir() {
	find "$(_get_project_dir)" -type d -path '*/target/release' \
		-exec sh -c 'for f in "$1"/*; do [ -f "$f" ] && [ -x "$f" ] && exit 0; done; exit 1' _ {} \; \
		-print -quit 2>/dev/null
}
_ensure_local_nvm() {
	local NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
	nvm install "${_nodeversion}"
	nvm use "${_nodeversion}"
}
_set_npm_build_env() {
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export npm_config_cache="${HOME}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_audit=false
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-${npm_config_registry:-https://registry.npmjs.org}}"
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
}
_set_rust_build_env() {
	export HOME="${srcdir}/.home"
	export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${CARGO_HOME}"
}
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256 512 1024) _src="$(_get_project_dir)/design/app-icon.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname}.png"
	done
}
prepare() {
	cd "$(_get_project_dir)"
	gendesk -q -f -n \
		--pkgname="${pkgname}" \
		--pkgdesc="${pkgdesc}" \
		--categories="AudioVideo" \
		--name="${_pkgname}" \
		--custom=Name[zh_CN]="${_zhsname}" \
		--exec="${pkgname} %U"
	_ensure_local_nvm
	_set_npm_build_env
	_set_rust_build_env
	jq '.bundle.active = false' src-tauri/tauri.conf.json > tmp.json && mv tmp.json src-tauri/tauri.conf.json
	rustup toolchain install stable
	rustup default stable
	export NODE_ENV=development
	npm install
	npm add -D "@tauri-apps/cli@^2"
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
	_set_npm_build_env
	_set_rust_build_env
	export NODE_ENV=production
	npx tauri build
}
package() {
	install -Dm755 "$(_get_app_dir)/"{"${pkgname}",guest_playurl_verify} -t "${pkgdir}/usr/bin"
	install -Dm644 "$(_get_project_dir)/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	_generate_icons
	install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}