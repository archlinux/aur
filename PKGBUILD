# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: surefire <surefire at cryptomile dot net>
# Contributor wenLiangcan <boxeed at gmail dot com>
pkgname=keeweb-git
_pkgname=KeeWeb
pkgver=1.18.9.r1.gad7891d
_electronversion=13
_nodeversion=20
pkgrel=1
pkgdesc="Free cross-platform password manager compatible with KeePass."
arch=('any')
url="https://keeweb.info/"
_ghurl="https://github.com/keeweb/keeweb"
license=('MIT')
conflicts=(
	"${pkgname%-git}"
	"${pkgname%-git}-web"
	"${pkgname%-git}-devel"
	"${pkgname%-git}-desktop"
)
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
	'libsecret'
    'libusb'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '5ec6b59a287204cbcbac040071f19d88897a0cb3156e794e6f05847cf5449a9e')
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
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -v '^$' | sed 's/^[^0-9]*//' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
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
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    _set_build_env
	jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
	sed -i "s/target: \['AppImage', 'rpm'\]/target: ['dir']/g" Gruntfile.js
	sed -i '/minimizerOptions:/,+2d' build/webpack.config.js
	sed -i '/^                {}$/d' build/webpack.config.js
    rm -rf package-lock.json
	export NODE_ENV=development
    npm install --legacy-peer-deps
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
	export NODE_ENV=production
    export NODE_OPTIONS=--openssl-legacy-provider
    npm run dev-desktop-linux -- --force
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    local _src="$(_get_project_dir)"
	install -Dm644 "${_src}/graphics/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
    install -Dm644 "${_src}/packages/deb/usr/share/applications/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/packages/deb/usr/share/applications/${pkgname%-git}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}