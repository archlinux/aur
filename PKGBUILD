# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-chat
_pkgname=GhostChat
pkgver=4.9.0
_nodeversion=24
pkgrel=1
pkgdesc="Transparent chat overlay for streamers. Twitch, YouTube, and Kick in one window."
arch=('any')
url="https://getghostchat.com/"
_ghurl="https://github.com/Enubia/ghost-chat"
license=('LicenseRef-DBAD')
conflicts=("${pkgname}")
depends=(
    'webkitgtk-6.0'
    'gtk3'
)
makedepends=(
    'pnpm'
    'npm'
    'gendesk'
    'go'
    'nvm'
    'git'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "modifiers_linux.go"
)
sha256sums=('a1de9e2788ea271949669cc2b8aca0f08a87f4426a777e9247002a1adbab96ca'
            '131035c2816a154359af542ff002e53f48419311e6ab083eb9f944a5e2f0d24c')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "go.mod" -o -name "go.sum" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
_ensure_local_nvm() {
	local NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
	nvm install "${_nodeversion}"
	nvm use "${_nodeversion}"
}
_set_go_build_env() {
	export HOME="${srcdir}/.home"
	export GOPATH="${HOME}/go"
	export GOCACHE="${HOME}/go-build"
	export GOENV="${HOME}/go/env"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOTOOLCHAIN=local
	export GOWORK=off
	mkdir -p "${HOME}" "${GOCACHE}" "${XDG_CONFIG_HOME}" "${XDG_CACHE_HOME}" "$(dirname "${GOENV}")"
	: > "${GOENV}"
	export PATH="${GOPATH}/bin:${PATH}"
}
_set_pnpm_build_env() {
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
	mkdir -p "${HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
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
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_pnpm_build_env
	_set_go_build_env
    cp "${srcdir}/modifiers_linux.go" internal/hotkey/modifiers_linux.go
    go install github.com/wailsapp/wails/v3/cmd/wails3@latest
    cd "$(_get_project_dir)/frontend"
    export NODE_ENV=development
    pnpm install
}
build() {
	cd "$(_get_project_dir)/build"
    _ensure_local_nvm
    _set_pnpm_build_env
	_set_go_build_env
    go mod tidy
    wails3 generate bindings -f '-tags production -trimpath -buildvcs=false -ldflags="-w -s -X main.version=v4.0.1"' -clean=true -ts
    cd "$(_get_project_dir)/frontend"
    export NODE_ENV=production
    pnpm run build
    cd "$(_get_project_dir)"
    go build -tags production -trimpath -buildvcs=false -ldflags="-w -s -X main.version=v4.0.1" -o bin/ghost-chat
}
package() {
    install -Dm755 "$(_get_project_dir)/bin/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "$(_get_project_dir)/build/appicon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 "$(_get_project_dir)/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
