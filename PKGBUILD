# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dash-player-git
_pkgname=DashPlayer
pkgver=6.19.1.r0.g4e5f551
_electronversion=45
_nodeversion=24
pkgrel=1
pkgdesc="A video player designed specifically for English learning.一款专为英语学习打造的视频播放器"
arch=('any')
url="https://dash-player.solidspoon.xyz/"
_ghurl="https://github.com/solidSpoon/DashPlayer"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    'yt-dlp'
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'jq'
    'zip'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
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
_set_yarn_build_env() {
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export YARN_CACHE_FOLDER="${HOME}/.yarn/cache"
	export YARN_NETWORK_CONCURRENCY=32
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}"
	local _yarnver _yarnmajor=0
	_yarnver="$(node -p "try { require('./package.json').packageManager?.split('@')[1]?.split('-')[0] || '' } catch { '' }" 2>/dev/null || true)"
	_yarnmajor="${_yarnver%%.*}"
	_yarnmajor="${_yarnmajor:-0}"
	if [[ "${_yarnmajor}" -ge 2 ]] 2>/dev/null || [[ -f .yarnrc.yml ]]; then
		export XDG_STATE_HOME="${HOME}/.local/state"
		export YARN_ENABLE_GLOBAL_CACHE=false
		export YARN_ENABLE_MIRROR=false
		export YARN_GLOBAL_FOLDER="${HOME}/.yarn/berry"
		export YARN_NODE_LINKER=node-modules
		export YARN_NM_MODE=hardlinks-local
		export YARN_ENABLE_TELEMETRY=false
		export YARN_ENABLE_SCRIPTS=true
		export YARN_HTTP_TIMEOUT=600000
		export YARN_HTTP_RETRY=5
		export YARN_NPM_REGISTRY_SERVER="${YARN_NPM_REGISTRY_SERVER:-${NPM_CONFIG_REGISTRY:-https://registry.yarnpkg.com}}"
		local _yarnhome="${HOME}/.yarn/install"
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${COREPACK_HOME}" "${_yarnhome}"
		if [[ -n "${_yarnver}" ]]; then
			npm install -g "@yarnpkg/cli-dist@${_yarnver}" --prefix "${_yarnhome}" --registry "${npm_config_registry}"
			export PATH="${_yarnhome}/bin:${PATH}"
		fi
	else
		export YARN_GLOBAL_FOLDER="${HOME}/.yarn/global"
		export YARN_LINK_FOLDER="${HOME}/.yarn/link"
		export YARN_TEMP_FOLDER="${HOME}/.yarn/tmp"
		export YARN_NETWORK_TIMEOUT=600000
		export YARN_CHILD_CONCURRENCY="$(nproc)"
		export YARN_FROZEN_LOCKFILE=true
		export YARN_IGNORE_ENGINES=true
		export YARN_PRODUCTION=false
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${YARN_LINK_FOLDER}" "${YARN_TEMP_FOLDER}" "${COREPACK_HOME}"
		export YARN_REGISTRY="${NPM_CONFIG_REGISTRY:-https://registry.yarnpkg.com}"
	fi
	local _reg="${NPM_CONFIG_REGISTRY:-https://registry.yarnpkg.com}"
	_reg="${_reg%/}"
	if [[ -f yarn.lock ]] && grep -q 'registry.yarnpkg.com' yarn.lock; then
		sed -i "s|https://registry.yarnpkg.com/|${_reg}/|g" yarn.lock
	fi
}
_use_local_electron_for_forge() {
	local _arch=$([[ "${CARCH}" == "aarch64" ]] && echo arm64 || [[ "${CARCH}" == "armv7h" ]] && echo armv7l || echo x64)
	local _zd="${srcdir}/electron-zips"
	local _zf="${_zd}/electron-v${SYSTEM_ELECTRON_VERSION}-linux-${_arch}.zip"
	mkdir -p "${_zd}"
	rm -f "${_zf}"
	( cd "${ELECTRON_DIST}" && find . \( -type f -o -type l \) -readable -print | zip -@ -0 -q -y "${_zf}" )
	[[ -s "${_zf}" ]] || { echo "ERROR: Failed to generate electron zip (directory not readable?)"; return 1; }
	find . -name "forge.config.*" ! -path "*/node_modules/*" -print0 | while IFS= read -r -d '' _cfg; do
		sed -i "/packagerConfig:[[:space:]]*{/a\\    electronZipDir: '${_zd}'," "${_cfg}"
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
	_set_yarn_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    [ -d lib ] || mkdir lib
    ln -sf "/usr/bin/ffmpeg" lib/ffmpeg
    ln -sf "/usr/bin/ffprobe" lib/ffprobe
    ln -sf "/usr/bin/yt-dlp" lib/yt-dlp
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    export NODE_ENV=development
    yarn install
    _use_local_electron_for_forge
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    _set_electron_build_env
	_set_yarn_build_env
    export NODE_ENV=production
    yarn run package
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "$(_get_project_dir)/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
