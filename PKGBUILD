# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rayburst-git
_pkgname=Rayburst
pkgver=4.0.1.beta.1.r4.gf91d8c0
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
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
sha256sums=('SKIP')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "src-tauri" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
    cd "$(_get_project_dir)"
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
    rustup update stable
    rustup default stable
    sed -i 's/"active": true,/"active": false,/g' src-tauri/tauri.conf.json
    sed -i -e "
        s/{{categories}}/Network;/g
        s/{{comment}}/${pkgdesc}/g
        s/{{exec}}/${pkgname%-git}/g
        s/{{icon}}/${pkgname%-git}/g
        s/{{name}}/${_pkgname}/g
    " "src-tauri/linux/${pkgname%-git}.desktop.hbs"
    cp src-tauri/icons/128x128@2x.png src-tauri/icons/256x256.png
    export NODE_ENV=development
    pnpm install
}
build() {
	cd "$(_get_project_dir)"
    export NODE_ENV=production
    pnpm run tauri build
}
package() {
    local _src="$(_get_project_dir)"
    local _targetdir="${_src}/src-tauri/target/release/"
    if [ -x "/usr/bin/aria2-next" ];then
        install -Dm755 "${_targetdir}"{"${pkgname%-git}","${pkgname%-git}-browser-launcher"} -t "${pkgdir}/usr/bin"
    else
        install -Dm755 "${_targetdir}"{aria2-next,"${pkgname%-git}","${pkgname%-git}-browser-launcher"} -t "${pkgdir}/usr/bin"
    fi
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -a "${_targetdir}/data" "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${_src}/src-tauri/linux/${pkgname%-git}.desktop.hbs" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${_src}/src-tauri/icons/${_icons}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}