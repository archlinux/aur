# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=folia-major
_pkgname=Folia
pkgver=0.7.13
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="Local music/navigation/third-party multi-platform online music player focusing on gorgeous lyrics animation effects.专注于绚丽的歌词动画效果的本地音乐/navidrome/第三方多平台在线音乐播放器."
arch=('any')
url="https://folia-site.cielaniska.top/"
_ghurl="https://github.com/chthollyphile/folia-major"
license=('AGPL-3.0-only')
depends=(
    "electron${_electronversion}"
    'python'
    'python-numpy'
    'python-psutil'
    'ffmpeg'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'rustup'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('05a8f0a67966bc96046ba6024c901e1288c091a75ab1857d0909e64c9eef90d8'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
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
	export npm_config_cache="${HOME}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_audit=false
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-${npm_config_registry:-https://registry.npmjs.org}}"
    export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}" "${CARGO_HOME}"
}
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -v '^$' | sed 's/^[^0-9]*//' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    _set_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    find electron -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    cp .env.example .env
    rustup update stable
    rustup default stable
    export NODE_ENV=development
    export npm_config_allow_remote=all
    rm -rf package-lock.json
    npm install
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
    _set_build_env
    export ELECTRON=true
    export NODE_ENV=production
    export NODE_OPTIONS="--max-old-space-size=4096"
    npm run build:vercel-api
    npx vite build
    npm run build:windowtolayer
    npm run build:wallpaper-helper
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
    local _app_dir="$(_get_app_dir)"
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/ffmpeg-audio/ffmpeg"
    rm -rf "${_app_dir}/resources/default_app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${_src}/packaging/aur/${pkgname}-bin/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
