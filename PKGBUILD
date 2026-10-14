# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yet-another-electron-term
_pkgname=YAET
pkgver=7.5.0
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="All-in-one remote connection manager. SSH/Telnet/WinRM/Serial terminals, SCP/FTP/SMB/WebDav/S3 file explorer, VNC/SPICE/RDP remote desktop."
arch=('any')
url="https://github.com/invince/YAET"
license=('Apache-2.0')
depends=(
    "electron${_electronversion}"
    'python'
    'libsecret'
    'nodejs'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'gendesk'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('ea8f5504a5f95b80ae945688d28e92ce7de29f4a07264f1357459bc3c5366eca'
            'dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
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
        s/@appname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility;System" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    sed -i -e "
        /const path = require(\"path\");/a \\
        const os = require('os');\nconst configHome = process.env.XDG_CONFIG_HOME || path.join(os.homedir(), '.config');
        s|const logPath = \`\${__dirname}/logs/main.log\`;|const logPath = path.join(configHome, '${pkgname}', 'logs', 'main.log');|
        " src-electron/electronMain.js
    export NODE_ENV=development
    npm install
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    export NG_CLI_ANALYTICS=false
    export CI=true
    npm run clean
    npx --yes patch-package
    node scripts/generate-plugin-barrel.js
    npx ng build --base-href ./
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -type d \
		\( -name 'darwin*' -o -name '*android*' -o -name 'win32*' -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
    rm -rf "${pkgdir}/usr/lib/${pkgname}/default_app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "$(_get_project_dir)/src-electron/assets/icons/app-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "$(_get_project_dir)/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
