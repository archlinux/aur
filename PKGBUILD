# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=miteiru
_pkgname=Miteiru
pkgver=7.6.1
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="An open source Electron video player to learn Chinese,Cantonese,and Japanese.It can play all Youtube and HTML 5 supported format videos,and lots of supports on other subtitle formats.(Use system-wide electron)"
arch=('any')
url="https://miteiru.hocky.id/"
_ghurl="https://github.com/hockyy/miteiru"
license=("CC-BY-NC-4.0")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'icoutils'
    'git'
    'jq'
)
optdepends=(
    'python-jieba'
    'pypinyin'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('37ebb3f1fb79032c6be8a6806a922fac8a8b33232ba7b7e76ce9e3de88a99683'
            'cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
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
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
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
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_build_env
    icotool -i 1 -x resources/icon.ico -o resources/icon.png
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    jq '.linux.icon = "resources/icon.png" | .linux.target = ["dir"] | .electronDist = "/usr/lib/electron'"${_electronversion}"'"' buildConfig/linux26.config.json > buildConfig/linux26.config.json.tmp
    mv buildConfig/linux26.config.json.tmp buildConfig/linux26.config.json
    sed -i 's/"moduleResolution": "bundler"/"moduleResolution": "node"/' renderer/tsconfig.json
    export NODE_ENV=development
    npm install
    jq '.exports["."] = {"types": "./dist/index.d.ts", "import": "./dist/index.module.js", "require": "./dist/index.js", "default": "./dist/index.module.js"}' node_modules/react-colorful/package.json > node_modules/react-colorful/package.json.tmp && mv node_modules/react-colorful/package.json.tmp node_modules/react-colorful/package.json
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    npm run build:linux26
    local _app_dir="$(_get_app_dir)"
    find "${_app_dir}/resources/app.asar.unpacked/node_modules" -type d \
        \( -name "android-*" -o -name "linux-arm*" -o -name "darwin-*" -o -name "win32-*" \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir="$(_get_app_dir)"
	rm -rf "${_app_dir}/resources/default_app.asar"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${_src}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
