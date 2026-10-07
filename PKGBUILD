# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netcatty
_pkgname=Netcatty
pkgver=1.1.83
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="AI-Powered SSH Client, SFTP Browser & Terminal Manager."
arch=(
    'aarcb64'
    'x86_64'
)
url="https://netcatty.app/"
_ghurl="https://github.com/binaricat/Netcatty"
license=('GPL-3.0-or-later')
depends=(
    "electron${_electronversion}"
    'python'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'gendesk'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('ca9f54ff99450788ff47c5c7f723da2332659062dbd43e80a14cd0f78e584573'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
	export npm_config_build_from_source=true
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
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
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"    
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System;Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    find electron -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    cat > noop-hook.cjs << 'EOF'
module.exports = function() {};
module.exports.default = module.exports;
EOF
    export NODE_ENV=development
    npm install
    npm add async-exit-hook
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    export NODE_OPTIONS=--disable-warning=DEP0190
    npm run build:plugin-packages
    npx vite build
    case "${CARCH}" in
        aarch64)
            npx electron-rebuild --force --arch arm64 -w "node-pty,@serialport/bindings-cpp"
            ;;
        x86_64)
            npx electron-rebuild --force --arch x64 -w "node-pty,@serialport/bindings-cpp"
            ;;
    esac
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} -c.beforePack=./noop-hook.cjs -c.npmRebuild=false --config electron-builder.config.cjs"
    local _app_dir="$(_get_app_dir)"
    case "${CARCH}" in
		aarch64)	_archrem=x64	;;
		x86_64)		_archrem=arm	;;
	esac
	find "${_app_dir}/resources/app.asar.unpacked" -type d \
		\( -name "darwin*" -o -name "win32*" -o -name "*${_archrem}"* \) \
		-exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname}/"
	rm -rf "${pkgdir}/usr/lib/${pkgname}/default_app.asar"
    local _src="$(_get_project_dir)"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
		install -Dm644 "${_src}/build/icons/${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
	done
	install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
