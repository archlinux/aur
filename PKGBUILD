# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=excel-parser-processor-git
_pkgname=Excel-Parser-Processor
pkgver=1.3.1.r503.g2fb910a
_electronversion=39
_nodeversion=22
pkgrel=1
pkgdesc="Simply generates an array of items from the rows of an Excel file and does the repetitive tedious operations step by step recursively till every item of the array is processed."
arch=('any')
url="https://github.com/btargac/excel-parser-processor"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
	"electron${_electronversion}"
)
makedepends=(
	'npm'
	'git'
	'nvm'
	'gendesk'
	'jq'
)
source=(
	"${pkgname%-git}.git::git+${url}.git"
	"${pkgname%-git}.sh"
)
sha256sums=('SKIP'
			'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
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
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
}
prepare() {
	cd "$(_get_project_dir)"
	_get_electron_version
	sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname%-git}/g
		s/@runname@/app.asar/g
		s/@cfgdirname@/${_pkgname//-/ }/g
	" "${srcdir}/${pkgname%-git}.sh"
	gendesk -q -f -n \
		--pkgname="${pkgname%-git}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Utility" \
		--name="${_pkgname}" \
		--exec="${pkgname%-git} %U"
	_ensure_local_nvm
	_set_build_env
	sed -i '/"devDependencies":/{:a;N;/^[[:space:]]*}/!ba;s/"electron": "[^"]*"/"electron": "'${SYSTEM_ELECTRON_VERSION}'"/}' package.json
	export NODE_ENV=development
	npm install --legacy-peer-deps
	npm install -D sass
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
	_set_build_env
	export NODE_ENV=production
	npm run build
	npm exec -c "electron-builder build --linux dir -c.electronDist=${ELECTRON_DIST}"
}
package() {
	local _src="$(_get_project_dir)"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
	_icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
	for _icons in "${_icon_sizes[@]}";do
		install -Dm644 "${_src}/build/icons/${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
	done
	install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}