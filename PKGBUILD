# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=turbowarp-desktop-git
_pkgname=TurboWarp
_appname="org.turbowarp.${_pkgname}"
pkgver=1.17.1.r2.gab95d03
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="Scratch mod with a compiler to run projects faster, dark mode for your eyes, a bunch of addons to improve the editor, and more."
arch=("any")
url="https://desktop.turbowarp.org/"
_ghurl="https://github.com/TurboWarp/desktop"
license=("GPL-3.0-only")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.js"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '0f4675ddc96a032accf82723c7b6b66007bafd18aa8d919b61e983a68fd25328')
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
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -oE '[0-9]+' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	(( _elec_ver == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m${_elec_ver}$([[ $c -eq 31 ]] && echo " (expected ${_electronversion})")\033[0m"
}
_set_npm_build_env() {
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
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
    " "${srcdir}/${pkgname%-git}.sh" "${srcdir}/${pkgname%-git}.js"
    _ensure_local_nvm
    _set_npm_build_env
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-git}/${pkgname%-git}/g
        s/${_appname}/${pkgname%-git}/g
    " linux-files/"${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-git}/g" linux-files/{"${_appname}.metainfo.xml","${_appname}.mime.xml"}
    git submodule update --depth=1 --init --recursive
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    export NODE_ENV=development
    npm install --legacy-peer-deps
    npm run fetch
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_npm_build_env
    export NODE_ENV=production
    npm run webpack:prod
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
    rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "$(_get_project_dir)/art/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "$(_get_project_dir)/linux-files/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "$(_get_project_dir)/linux-files/${_appname}.mime.xml" "${pkgdir}/usr/share/mime/applications/${pkgname%-git}.mime.xml"
    install -Dm644 "$(_get_project_dir)/linux-files/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
