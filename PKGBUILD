# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=grabbit-git
_pkgname=Grabbit
pkgver=1.3.4.r5.g8c1d094
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="A cross-platform download manager powered by aria2. Beautiful, easy to use, and powerful."
arch=(
	'aarch64'
	'x86_64'
)
url="https://cassidoo.github.io/grabbit/"
_ghurl="https://github.com/ricode-labs/grabbit"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
	"electron${_electronversion}"
	'nodejs'
	'aria2'
	'perl'
)
makedepends=(
	'npm'
	'git'
	'nvm'
	'gendesk'
	'jq'
)
options=(
	'!strip'
)
source=(
	"${pkgname//-/.}::git+${_ghurl}.git"
	"${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
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
_use_local_electron_for_forge() {
	local _arch=$([[ "${CARCH}" == "aarch64" ]] && echo arm64 || [[ "${CARCH}" == "armv7h" ]] && echo armv7l || echo x64)
	local _zd="${srcdir}/electron-zips"
	local _zf="${_zd}/electron-v${SYSTEM_ELECTRON_VERSION}-linux-${_arch}.zip"
	mkdir -p "${_zd}"
	rm -f "${_zf}"
	( cd "${ELECTRON_DIST}" && find . \( -type f -o -type l \) -readable -print | zip -@ -0 -q -y "${_zf}" )
	[[ -s "${_zf}" ]] || { echo "ERROR: Failed to generate electron zip (directory not readable?)"; return 1; }
	find . -name "forge.config.*" ! -path "*/node_modules/*" -print0 | while IFS= read -r -d '' _cfg; do
		sed -i "/packagerConfig:[[:space:]]*{/a\\    electronZipDir: '${_zd}'," "${_cfg}"
	done
}
prepare() {
	cd "$(_get_project_dir)"
	_get_electron_version
	sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname%-git}/g
	" "${srcdir}/${pkgname%-git}.sh"
	gendesk -q -f -n \
		--pkgname="${pkgname%-git}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Network" \
		--name="${_pkgname}" \
		--exec="${pkgname%-git} %U"
	_ensure_local_nvm
	_set_build_env
	jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
	find src -type f -exec sed -i "s/process\.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
	export NODE_ENV=development
	npm install
	cd node_modules/node-portmapping
	npm install
	cd "$(_get_project_dir)"
	_use_local_electron_for_forge
	sed -i "/packagerConfig:[[:space:]]*{/a\\    dir: true,\n    asarUnpack: ['node_modules/node-portmapping/**', 'node_modules/registry-js/**']," forge.config.ts
	sed -i '/export function getCompletedTasks/i\export function addUnfinishedTasks(gid: string) {\n  // Stub function - unfinished tasks not implemented\n}' src/main/tasks.ts
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
	_set_build_env
	export NODE_ENV=production
	#npm run update:aria2
	local _arch_keep=$([[ "${CARCH}" == "aarch64" ]] && echo "arm64" || echo "x86_64")
	ln -sf "/usr/bin/aria2c" "resources/aria2/aria2c-linux-${_arch_keep}"
	find resources/aria2 -type f ! -name "*linux-${_arch_keep}*" -delete
	npm run package
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
	for _mod in node-portmapping registry-js; do
		[[ -d "$(_get_project_dir)/node_modules/$_mod" ]] || continue
		install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}/node_modules/$_mod"
		cp -a "$(_get_project_dir)/node_modules/$_mod/." "${pkgdir}/usr/lib/${pkgname%-git}/node_modules/$_mod/"
	done
	for _size in 16 32 64 96 128 256 512 1024; do
		[[ -f "$(_get_project_dir)/resources/icons/icon-${_size}.png" ]] || continue
		install -Dm644 "$(_get_project_dir)/resources/icons/icon-${_size}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname%-git}.png"
	done
	install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
