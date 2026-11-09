# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=miteiru
_pkgname=Miteiru
pkgver=8.1.0
_nodeversion=24
pkgrel=1
pkgdesc="Free video player for learning Japanese, Mandarin, Cantonese and Vietnamese from what you watch. Click any subtitle word for its reading and offline dictionary meaning. Plays local files and YouTube, with dual subtitles, karaoke lyrics and Anki export."
arch=('any')
url="https://miteiru.hocky.id/"
_ghurl="https://github.com/hockyy/miteiru"
license=("CC-BY-NC-4.0")
conflicts=("${pkgname}")
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
	'libayatana-indicator'
	'libappindicator'
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'icoutils'
    'git'
    'jq'
)
optdepends=(
    'python-jieba'
    'pypinyin'
    'yt-dlp'
    'mecab'
)
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47e110926606635d00de746fcdcdcab8eda313e13abd41d76ab6975fc14371ed')
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
_ensure_local_nvm() {
	local NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
	nvm install "${_nodeversion}"
	nvm use "${_nodeversion}"
}
_get_app_dir() {
	find "$(_get_project_dir)" -type d -name "release" -exec test -d "{}/.fingerprint" -a -d "{}/deps" \; -print -quit 2>/dev/null
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
prepare() {
    cd "$(_get_project_dir)"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_npm_build_env
    _set_rust_build_env
    jq '.bundle.active = false' src-tauri/tauri.conf.json > tmp.json && mv tmp.json src-tauri/tauri.conf.json
    rustup update stable
    rustup default stable
    export NODE_ENV=development
    npm install
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_npm_build_env
    _set_rust_build_env
    export NODE_ENV=production
    npm run tauri:build
}
package() {
    install -Dm755 "$(_get_app_dir)/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -a "$(_get_app_dir)/"{libmpv,live-captions,language-packs.json} "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "$(_get_project_dir)/resources/icon.png" \
			"${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
	install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "$(_get_project_dir)/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}