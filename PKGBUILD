# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bili-music
_pkgname='Bili Music'
_zhsname='午夜黑胶'
pkgver=1.0.0
_nodeversion=24
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
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('773016238b1ab736fdc3e679c9a2bda135a5647e34b5812e9bfee14321dc8250')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "src-tauri" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
_get_app_dir() {
	find "$(_get_project_dir)" -type d -name "release" -exec test -d "{}/.fingerprint" -a -d "{}/deps" \; -print -quit 2>/dev/null
}
_set_build_env() {
	export HOME="${srcdir}/.home"
	export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
    export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export npm_config_cache="${HOME}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_audit=false
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}" "${CARGO_HOME}"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
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
    _set_build_env
    jq '.bundle.active = false' src-tauri/tauri.conf.json > tmp.json && mv tmp.json src-tauri/tauri.conf.json
    rustup update stable
    rustup default stable
    npm install @tauri-apps/cli@^2
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    npx tauri build
}
package() {
    install -Dm755 "$(_get_app_dir)/"{"${pkgname}",guest_playurl_verify} -t "${pkgdir}/usr/bin"
    install -Dm644 "$(_get_project_dir)/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/design/app-icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
