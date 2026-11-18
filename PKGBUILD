# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mediago-git
_pkgname=MediaGo
pkgver=3.5.0.r196.gc4a1cac
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="Video online extraction tool streaming media download, video download,m3u8 download,Bilibili video download.视频在线提取工具,流媒体下载,视频下载,m3u8下载,B站视频下载."
arch=('x86_64')
url="https://downloader.caorushizi.cn/"
_ghurl="https://github.com/caorushizi/mediago"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
	"electron${_electronversion}"
	'ffmpeg'
	'aria2'
	'yt-dlp'
	'deno'
	'n-m3u8dl-re'
	'bbdown'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'pnpm'
    'jq'
    'go'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.js"
    "${pkgname%-git}.sh"
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
	local _v=$(find "$(_get_project_dir)" -name package.json ! -path '*/node_modules/*' -exec jq -r '.. | (.electron? // empty) | strings' {} + 2>/dev/null | sed 's/^[^0-9]*//' | grep -E '^[0-9]' | head -1 | sed 's/\..*//')
	_v=${_v:-$(grep -hoE 'electron[@":][^0-9]*[0-9]+\.[0-9.]+' "$(_get_project_dir)"/*lock* 2>/dev/null | grep -oE '[0-9]+\.[0-9.]+' | head -1 | sed 's/\..*//')}
	[[ "$_v" =~ ^[0-9] ]] || return 1
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
_link_system_runtime_deps() {
	local _deps_dir="$(_get_project_dir)/.deps/linux-x64"
	local _entry _sysbin _name _pkg
	mkdir -p "${_deps_dir}"
	for _entry in \
		"/usr/bin/ffmpeg:ffmpeg:ffmpeg" \
		"/usr/bin/aria2c:aria2c:aria2" \
		"/usr/bin/yt-dlp:yt-dlp:yt-dlp" \
		"/usr/bin/deno:deno:deno" \
		"/usr/bin/n-m3u8dl-re:N_m3u8DL-RE:n-m3u8dl-re-bin" \
		"/usr/bin/BBDown:BBDown:bbdown-bin"; do
		IFS=':' read -r _sysbin _name _pkg <<<"${_entry}"
		if [ ! -x "${_sysbin}" ]; then
			echo -e "\033[1;31mMissing runtime dependency ${_sysbin}, please install package: ${_pkg}\033[0m" >&2
			return 1
		fi
		ln -sf "${_sysbin}" "${_deps_dir}/${_name}"
	done
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
	_set_go_build_env
	jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' apps/electron/package.json > apps/electron/package.json.tmp \
		&& mv apps/electron/package.json.tmp apps/electron/package.json
	go install github.com/swaggo/swag/cmd/swag@latest
	sed -i '/^const config = getReleaseConfig();$/a config.electronDist = process.env.ELECTRON_DIST;' \
		"$(_get_project_dir)/packages/tooling/src/electron/build.ts"
	grep -q 'config.electronDist = process.env.ELECTRON_DIST' "$(_get_project_dir)/packages/tooling/src/electron/build.ts" || return 1
	export NODE_ENV=development
	pnpm install
	_link_system_runtime_deps
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
	_set_electron_build_env
	_set_pnpm_build_env
	_set_go_build_env
	export NODE_ENV=production
	set -a
	source "$(_get_project_dir)/.env"
	set +a
	export MEDIAGO_PROFILE=production
	export MEDIAGO_DEPS_ROOT="$(_get_project_dir)/.deps"
	export MEDIAGO_DEPS_DIR="${MEDIAGO_DEPS_ROOT}/linux-x64"
	pnpm core:build:production
	pnpm build:electron:raw
	pnpm -F @mediago/electron run pack
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "$(_get_project_dir)/apps/electron/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}