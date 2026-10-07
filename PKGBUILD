# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Raansu
# Contributor: Lance G. <Gero3977@gmail.com>
pkgname=postybirb-plus
pkgver=3.1.76
_electronversion=19
_nodeversion=18
pkgrel=1
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly. Postybirb plus version (Client/Server)."
url="https://www.postybirb.com"
_ghurl="https://github.com/mvdicarlo/postybirb-plus"
arch=('any')
license=('BSD-3-Clause')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'gendesk'
    'yarn'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('ffee8357929cc7c4e1d2e63728ac15e7d294d1229f881e737d58d3792c4374f9'
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
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_build_env
    jq '.compilerOptions.ignoreDeprecations = "6.0"' ui/tsconfig.json > ui/tsconfig.json.tmp && mv ui/tsconfig.json.tmp ui/tsconfig.json
    echo 'declare module "*.css";' >> ui/src/react-app-env.d.ts
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' electron-app/package.json > electron-app/package.json.tmp && mv electron-app/package.json.tmp electron-app/package.json
    export NODE_OPTIONS="--openssl-legacy-provider"
    export NODE_ENV=development
    npm install --legacy-peer-deps --prefer-offline --ignore-scripts
    cd commons && npm install --legacy-peer-deps && npm run build && cd ..
    cd electron-app && npm install --legacy-peer-deps && cd ..
    cd ui && npm install --legacy-peer-deps && cd ..
    cd electron-app && npx electron-builder install-app-deps && cd ..
    node create-signer.js
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_OPTIONS="--openssl-legacy-provider"
    export NODE_ENV=production
    npm run build
    cd "$(_get_project_dir)/electron-app"
    unset NODE_OPTIONS
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    local _app_dir="$(_get_app_dir)"
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname}/default_app.asar"
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/ui/public/assets/icons/minnowicon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "${_src}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}