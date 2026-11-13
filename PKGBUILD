# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=plein-git
_pkgname=Plein
pkgver=0.15.0.r0.g35cfa50
_electronversion=45
_nodeversion=26
pkgrel=1
pkgdesc=" Start from a single idea, lay out the script, storyboard, shots and voiceover on the canvas, and finish your work together with an AI agent."
arch=('any')
url="https://plein.ikuyu.com"
_ghurl="https://github.com/hoobnn/plein"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
	"electron${_electronversion}"
    'ffmpeg'
	'nodejs'
    'libass'
)
makedepends=(
	'npm'
	'git'
	'nvm'
	'gendesk'
	'pnpm'
	'jq'
)
source=(
	"${pkgname//-/.}::git+${_ghurl}.git"
	"${pkgname%-git}.js"
	"${pkgname%-git}.sh"
)
options=(
	'!strip'
	'!emptydirs'
)
sha256sums=('SKIP'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'd1e4e7e73d690e97039739dd1bf8f1eb046c2fd7e44305b15008ad842a503904')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
	cd "$(_get_project_dir)" || return 1
	local _t=$(git tag --list --sort=-v:refname | grep -m1 -E '^v?[0-9]+(\.[0-9]+)+$' || :)
	local _n=$(git rev-list --count "${_t:+$_t..}HEAD") _s=$(git rev-parse --short=7 HEAD)
	[[ -n $_t ]] && printf '%s.r%s.g%s\n' "${_t#v}" "$_n" "$_s" || printf 'r%s.%s\n' "$_n" "$_s"
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
	local _detected=""
	local _pkgjson="$(_get_project_dir)/package.json"
	if [ -f "${_pkgjson}" ]; then
		_detected="$(grep -o '"packageManager"[^,]*' "${_pkgjson}" 2>/dev/null | grep -oE 'pnpm@[^"+]+' | head -n1 | sed 's/^pnpm@//')"
		if [ -z "${_detected}" ]; then
			_detected="$(grep -oE '"pnpm"[[:space:]]*:[[:space:]]*"[^"]+"' "${_pkgjson}" 2>/dev/null | grep -oE '[0-9][0-9.]*' | head -n1)"
		fi
	fi
	local _ver="${_pnpmver:-${_detected}}"
	if [ -n "${_ver}" ]; then
		npm install -g "pnpm@${_ver}" --prefix "${HOME}/.pnpm" \
			--registry "${COREPACK_NPM_REGISTRY}"
	fi
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
		--categories="AudioVideo" \
		--name="${_pkgname}" \
		--exec="${pkgname%-git} %U"
	_ensure_local_nvm
	_set_electron_build_env
	_set_pnpm_build_env
	jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
	export NODE_ENV=development
	pnpm install
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
	_set_electron_build_env
	_set_pnpm_build_env
	export NODE_ENV=production
    export PLEIN_VERSION="${pkgver%.r*}"
	pnpm --filter @plein/web build
    cd apps/desktop
	pnpm run stage:server
	pnpm -c exec "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.config.mjs"
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
	install -Dm755 -d "$(_get_app_dir)/resources/ffmpeg"
	ln -sf "/usr/bin/ffmpeg" "$(_get_app_dir)/resources/ffmpeg/ffmpeg"
	ln -sf "/usr/bin/ffprobe" "$(_get_app_dir)/resources/ffmpeg/ffprobe"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
	install -Dm644 "$(_get_project_dir)/apps/web/public/plein-icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-git}.png"
	install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
