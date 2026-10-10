# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Zaoqi
pkgname=electerm
pkgver=5.5.76
_electronversion=42
_nodeversion=24
pkgrel=2
pkgdesc="Free and open-sourced terminal/ssh/sftp/ftp/telnet/serialport/RDP/VNC/Spice client."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://electerm.org/"
_ghurl="https://github.com/electerm/electerm"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
    'nodejs'
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'python-setuptools'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('d1b438141bb162ac0d0ff4862ee018b5266a1d21e1ab3f848de478dfc63fcc1d'
            'cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
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
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
		| grep -oE '[0-9]+' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	(( _elec_ver == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m${_elec_ver}$([[ $c -eq 31 ]] && echo " (expected ${_electronversion})")\033[0m"
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
        --categories="System" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    rm -rf package-lock.json
    export NODE_ENV=development
    npm config set legacy-peer-deps true
    npm install
    npm add -D node-gyp
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    npm run clean
    npm run compile
    npm run prepare-file
    WORKFLOW_NAME=linux-pkgbuild npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config build/electron-builder.json"
    local _app_dir="$(_get_app_dir)"
    find "${_app_dir}/resources" -type d -exec chmod 755 {} +
	case "${CARCH}" in
		aarch64)	_archrem=x64	    ;;
        armv7h)     _archrem=64	        ;;
		x86_64)		_archrem=arm	    ;;
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
    install -Dm644 "${_src}/node_modules/@${pkgname}/${pkgname}-resource/build-res/appx/StoreLogo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${_src}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
