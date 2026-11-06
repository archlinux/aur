# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inkstone-git
_pkgname=Inkstone
_zhsname='砚'
pkgver=0.14.0.r1.g1eed44f
_electronversion=45
_nodeversion=24
pkgrel=1
pkgdesc="A lightweight desktop client for pi, with MCP and project workspaces."
arch=('any')
url="https://github.com/Yu-DaTouX/Inkstone"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
	"electron${_electronversion}"
    'nodejs'
    'python'
)
makedepends=(
	'npm'
	'git'
	'nvm'
	'gendesk'
	'jq'
)
source=(
	"${pkgname//-/.}::git+${url}.git"
	"${pkgname%-git}.js"
	"${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'ace275e253744ca62d2572776df26b947f3c89616239985003126db635fc300e')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
	cd "$(_get_project_dir)"
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
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
_get_electron_version() {
	local _v
	_v=$(jq -r '.. | (.electron? // empty) | strings' "$(_get_project_dir)/package.json" 2>/dev/null | head -1)
	[[ -z "$_v" ]] && _v=$(grep -oE 'electron@[0-9.]+' "$(_get_project_dir)/pnpm-lock.yaml" 2>/dev/null | head -1 | sed 's/^electron@//')
	[[ -z "$_v" ]] && _v=$(grep -oE 'electron@npm:[0-9.]+' "$(_get_project_dir)/yarn.lock" 2>/dev/null | head -1 | sed 's/^electron@npm://')
	[[ -z "$_v" ]] && _v=$(jq -r '.packages["node_modules/electron"].version // empty' "$(_get_project_dir)/package-lock.json" 2>/dev/null | head -1)
	[[ -z "$_v" ]] && _v=$(grep -oE 'electron: ?\[?"?npm:?[0-9.]+' "$(_get_project_dir)/bun.lock" 2>/dev/null | grep -oE '[0-9.]+' | head -1)
	[[ -z "$_v" ]] && return 1
	_v="$(printf '%s' "$_v" | sed 's/^[^0-9]*//')"
	[[ "$_v" =~ ^[0-9] ]] || return 1
	_v="${_v%%.*}"
	(( ${_v} == _electronversion )) && echo -e "\033[1;32mElectron version: ${_v}\033[0m" || echo -e "\033[1;31mElectron version: ${_v} (expected ${_electronversion})\033[0m"
}
_set_electron_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
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
prepare() {
	cd "$(_get_project_dir)"
	_get_electron_version
	sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname%-git}/g
	" "${srcdir}/${pkgname%-git}.sh" "${srcdir}/${pkgname%-git}.js"
	gendesk -q -f -n \
		--pkgname="${pkgname%-git}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Development" \
		--name="${_pkgname}" \
		--exec="${pkgname%-git} %U" \
        --custom=Name[zh]="${_zhsname}"
	_ensure_local_nvm
	_set_electron_build_env
	_set_npm_build_env
	jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
	export NODE_ENV=development
	npm install
    npm install -g "@earendil-works/pi-coding-agent"
    npm add -D node-pty
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
	_set_electron_build_env
	_set_npm_build_env
	export NODE_ENV=production
    npm run vendor:pi
	npm run build
	npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.yml"
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
	install -Dm644 "$(_get_project_dir)/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname%-git}.png"
	install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
