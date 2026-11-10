# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=exifcleaner
_pkgname=ExifCleaner
pkgver=4.8.0
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="Clean metadata from images, videos, PDFs, and other files."
arch=('any')
url="https://exifcleaner.com/"
_ghurl="https://github.com/szTheory/exifcleaner"
license=('MIT')
depends=(
    "electron${_electronversion}"
    'perl'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'yarn'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.js"
    "${pkgname}.sh"
)
sha256sums=('f81e708fd154f05b99dc240c9fa4a0a5b76624b4e9e19e16590e713386d64e04'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'd1e4e7e73d690e97039739dd1bf8f1eb046c2fd7e44305b15008ad842a503904')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
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
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname}/g
	" "${srcdir}/${pkgname}.sh" "${srcdir}/${pkgname}.js"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics;Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_electron_build_env
	_set_yarn_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    export NODE_ENV=development
	yarn install
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
    _set_electron_build_env
	_set_yarn_build_env
    export NODE_ENV=production
	yarn compile
    yarn electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}"
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "$(_get_project_dir)/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "$(_get_project_dir)/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
