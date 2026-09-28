# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=smartsub-git
_pkgname=SmartSub
_zhsname='妙幕'
pkgver=3.9.0.r0.ga2b164b
_electronversion=30
_nodeversion=20
pkgrel=1
pkgdesc="Free, open-source desktop app to generate, translate, dub & burn video subtitles — local Whisper speech-to-text, AI dubbing & voice cloning, offline, GPU-accelerated."
arch=('x86_64')
url="https://smartsub.linxiaodong.com/"
_ghurl="https://github.com/buxuku/SmartSub"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'python-openai-whisper'
    'ffmpeg'
    'nodejs'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
_get_app_dir() {
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -v '^$' | sed 's/^[^0-9]*//' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
_set_build_env() {
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	local HOME="${srcdir}/.electron-gyp"
    local electronDist="/usr/lib/electron${_electronversion}"
	mkdir -p "${srcdir}/.electron-gyp"
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export YARN_REGISTRY="https://registry.npmmirror.com"
			export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
			export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
			export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
			export YARN_PLUGINS_FOLDER="${srcdir}/.yarn/plugins"
			export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
			export YARN_USE_HARDLINKS=true
			# export YARN_BUILD_FROM_SOURCE=true
			export YARN_LINK_WORKSPACE_PACKAGES=true
			export YARN_FETCH_RETRIES=3
			export YARN_FETCH_RETRY_TIMEOUT=10000
			export YARN_NETWORK_CONCURRENCY=32
		}
		find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
	fi
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
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
	_yarnver="$(node -p "require('./package.json').packageManager?.split('@')[1]?.split('-')[0] || ''" 2>/dev/null)"
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
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${COREPACK_HOME}"
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
	fi
	local _reg="${NPM_CONFIG_REGISTRY:-https://registry.yarnpkg.com}"
	_reg="${_reg%/}"
	if [[ -f .yarnrc ]]; then
		sed -i "s|^registry .*|registry \"${_reg}\"|" .yarnrc
	fi
	if [[ -f yarn.lock ]] && grep -q 'resolved "https://registry.yarnpkg.com' yarn.lock; then
		sed -i "s|https://registry.yarnpkg.com/|${_reg}/|g" yarn.lock
	fi
}
prepare() {
    cd "$(_get_project_dir)"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _get_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --custom=Name[zh_CN]="${_zhsname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    find main -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=development    yarn sherpa:fetch
    curl -L -o "${srcdir}/addon-linux-x64.node" \
        "https://github.com/buxuku/whisper.cpp/releases/download/latest/addon-linux-x64.node"
    curl -L -o "${srcdir}/addon-linux-vulkan.node.gz" \
        "https://github.com/buxuku/whisper.cpp/releases/download/latest/addon-linux-vulkan.node.gz"
    cp "${srcdir}/addon-linux-x64.node" extraResources/addons/addon.node
    gunzip -c "${srcdir}/addon-linux-vulkan.node.gz" > extraResources/addons/addon.vulkan.node
    BUILD_PLATFORM=linux BUILD_ARCH=x64 node scripts/inject-build-info.js
}
build() {
    cd "$(_get_project_dir)"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}" --config=electron-builder.yml
    local _app_dir=$(_get_app_dir)
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/app.asar.unpacked/node_modules/@ffmpeg-installer/linux-x64/ffmpeg"
}
package() {
    local _src="$(_get_project_dir)"
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
