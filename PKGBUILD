# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redisinsight-git
_pkgname='Redis Insight'
pkgver=3.10.0.r2.g7275842
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="Desktop manager that provides an intuitive and efficient GUI for Redis, allowing you to interact with your databases, monitor, and manage your data."
arch=('any')
url="https://redis.io/insight/"
_ghurl="https://github.com/RedisInsight/RedisInsight"
license=('SSPL-1.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'gtk3'
    'alsa-lib'
    'nss'
    'libsecret'
    'nodejs'
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'jq'
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
sha256sums=('SKIP')
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
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} --no-sandbox %U"
    _ensure_local_nvm
    _set_electron_build_env
    _set_yarn_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    export NODE_ENV=development
    yarn --cwd "${pkgname%-git}" add -D "${pkgname%-git}-plugin-sdk" "react-json-tree" "@antv/x6" "@antv/x6-react-shape" "plotly.js-dist-min" "@antv/hierarchy"
    yarn install
    yarn add -D "parcel" "@parcel/transformer-sass" "@parcel/transformer-less" "@nestjs/cli"
    yarn --cwd "${pkgname%-git}"/api/ install
    # Fix vite file: reference for ui/src/packages plugins
    mkdir -p "${pkgname%-git}/ui/src/packages/node_modules"
    local _node_modules="$(_get_project_dir)/node_modules"
    local _pkg_node_modules="${pkgname%-git}/ui/src/packages/node_modules"
    ln -sf "${_node_modules}/vite" "${_pkg_node_modules}/vite"
    ln -sf "${_node_modules}/vite-plugin-static-copy" "${_pkg_node_modules}/vite-plugin-static-copy"
    ln -sf "${_node_modules}/vite-plugin-ejs" "${_pkg_node_modules}/vite-plugin-ejs"
    ln -sf "${_node_modules}/@vitejs/plugin-react" "${_pkg_node_modules}/@vitejs/plugin-react"
    ln -sf "${_node_modules}/vite-plugin-svgr" "${_pkg_node_modules}/vite-plugin-svgr"
    ln -sf "${_node_modules}/esbuild" "${_pkg_node_modules}/esbuild"
    ln -sf "${_node_modules}/dotenv" "${_pkg_node_modules}/dotenv"
    ln -sf "${_node_modules}/react" "${_pkg_node_modules}/react"
    ln -sf "${_node_modules}/react-dom" "${_pkg_node_modules}/react-dom"
    ln -sf "${_node_modules}/@types/react" "${_pkg_node_modules}/@types/react"
    ln -sf "${_node_modules}/@types/react-dom" "${_pkg_node_modules}/@types/react-dom"
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_electron_build_env
    _set_yarn_build_env
    export NODE_ENV=production
    npx patch-package
    yarn run build:statics
    yarn ts-node ./scripts/prebuild.js dist
    yarn run build:prod
    yarn electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}" --config="electron-builder.json"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-git}"}
    cp -a "$(_get_app_dir)/." "${pkgdir}/usr/lib/${pkgname%-git}"
    ln -sf "/usr/lib/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "$(_get_project_dir)/resources/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}