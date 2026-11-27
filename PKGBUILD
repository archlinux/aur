# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
pkgname=vieb
_pkgname=Vieb
pkgver=12.12.1
_electronversion=45
_nodeversion=24
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design."
arch=('any')
url="https://vieb.dev/"
_ghurl="https://github.com/Jelmerro/Vieb"
license=('GPL-3.0-only')
depends=(
	"electron${_electronversion}"
)
makedepends=(
	'npm'
	'nvm'
	'git'
	'gendesk'
	'jq'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgver}.tar.gz"
	"${pkgname}.js"
	"${pkgname}.sh"
)
sha256sums=('0cb3200002f634ac5c645e8ee4a01c8d5496cc6d0310662259d94ef344f1dbbf'
            '4e629b50633624a4092c6d105aa2300bb0b1c7d979599a843b4468d903886f3b'
            '739eaf5396ac7f1373d907904f068e8a10a18ef91af7c35ca05adbff46322c97')
_get_project_dir() {
	local _d _f _t _bt= _best= _bs=0
	while IFS= read -r _d; do
		_t=$(jq -er '((.dependencies // {}) + (.devDependencies // {}) + (.optionalDependencies // {}) + (.peerDependencies // {})) as $a
			| select([$a | keys[] | select(test("^(electron|@electron-forge/|@electron/)"))] | length > 0)
			| if (.devDependencies // {}) | has("@electron-forge/cli") then "electron-forge"
			elif (.devDependencies // {}) | has("electron-builder") then "electron-builder"
			elif (.devDependencies // {}) | has("electron-packager") then "electron-packager"
			elif (.build | type) == "object" then "electron-builder" else "" end' "${_d}/package.json" 2>/dev/null) || continue
		for _f in "${_d}"/forge.config.*; do [[ -e ${_f} ]] && _t=electron-forge; done
		for _f in "${_d}"/electron-builder.{yml,yaml,json,json5,toml}; do [[ -e ${_f} ]] && _t=electron-builder; done
		(( 1 + (${#_t} > 0) > _bs )) && { _best=${_d}; _bt=${_t}; _bs=$((1 + (${#_t} > 0))); }
	done < <(find "${srcdir}" \( -name '.*' -o -name node_modules \) -prune -o -type f -name package.json -printf '%h\n' 2>/dev/null)
	[[ -n ${_best} ]] || { echo "ERROR: no package.json depending on electron under ${srcdir}" >&2; return 1; }
	[[ ${1} == tool ]] && printf '%s\n' "${_bt}" || printf '%s\n' "${_best}"
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
	local _v=$(find "$(_get_project_dir)" -name package.json ! -path '*/node_modules/*' -exec jq -r '.. | (.electron? // empty) | strings' {} + 2>/dev/null | sed 's/^[^0-9]*//' | grep -E '^[0-9]' | head -1 | sed 's/\..*//')
	_v=${_v:-$(grep -hoE 'electron[@":][^0-9]*[0-9]+\.[0-9.]+' "$(_get_project_dir)"/*lock* 2>/dev/null | grep -oE '[0-9]+\.[0-9.]+' | head -1 | sed 's/\..*//')}
	[[ "$_v" =~ ^[0-9] ]] || return 1
	(( ${_v} == _electronversion )) && echo -e "\033[1;32mElectron version: ${_v}\033[0m" || echo -e "\033[1;31mElectron version: ${_v} (expected ${_electronversion})\033[0m"
}
_delete_other_arch_files() {
	local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -mindepth 1 -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name "*bsd*" -o -name "*musl*" -o -name "*loong*" -o -name "*riscv*" -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
	find "$(_get_app_dir)" -mindepth 1 -type f \
		\( -name '*darwin*.node' -o -name '*android*.node' -o -name 'win32*.node' -o -name "*ia32*.node" -o -name "*${_archrem}*.node" \) \
		-prune -exec rm -rf {} +
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
_set_electron_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
}
_set_npm_build_env() {
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
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256 512 1024) _src="$(_get_project_dir)/app/img/icons/1024x1024.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname}.png"
	done
}
prepare() {
	cd "$(_get_project_dir)"
	_get_electron_version
	sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname}/g
	" "${srcdir}/${pkgname}.sh" "${srcdir}/${pkgname}.js"
	gendesk -q -f -n \
		--pkgname="${pkgname}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Network;WebBrowser" \
		--name="${_pkgname}" \
		--exec="${pkgname} %U"
	_ensure_local_nvm
	_set_electron_build_env
	_set_npm_build_env
	jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
	export NODE_ENV=development
	npm install
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
	_set_electron_build_env
	_set_npm_build_env
	export NODE_ENV=production
	npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
	_delete_other_arch_files
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname}/"
	_generate_icons
	install -Dm644 "$(_get_project_dir)/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}