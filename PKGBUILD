# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-widgets-git
_pkgname='Electron-Widgets'
pkgver=2.1.7.r29.g5be2e0b
_electronversion=38
_nodeversion=22
pkgrel=1
pkgdesc="Allows users to create and manage widgets on their desktops. These widgets enable users to quickly and easily access the information or tools they need."
arch=('any')
url="https://electron-widgets.vercel.app/"
_ghurl="https://github.com/sametcn99/electron-widgets"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'bun'
    'git'
    'nvm'
    'gendesk'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.js"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'b2190e52307557102005cf35ba6fdc921487428224761ecbc554d4dd91764c2b'
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
pkgver() {
	cd "$(_get_project_dir)" || return 1
	local _t=$(git tag --list --sort=-v:refname | grep -m1 -E '^v?[0-9]+(\.[0-9]+)+(-[0-9A-Za-z][0-9A-Za-z.-]*)?$' || :)
	local _n=$(git rev-list --count "${_t:+$_t..}HEAD") _s=$(git rev-parse --short=7 HEAD) _v=${_t#v}; _v=${_v//-/_}
	[[ -n $_t ]] && printf '%s.r%s.g%s\n' "$_v" "$_n" "$_s" || printf 'r%s.%s\n' "$_n" "$_s"
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
	local _pd _v _lock
	_pd=$(_get_project_dir) || return 1
	_v=$(find "$(_get_project_dir)" -maxdepth 2 -name package.json ! -path '*/node_modules/*' -exec jq -r '.. | (.electron? // empty) | strings' {} + 2>/dev/null | sed 's/^[^0-9]*//' | grep -E '^[0-9]' | head -1 | sed 's/\..*//')
	if [[ -z ${_v} ]]; then
		while IFS= read -r _lock; do
			_v=$(grep -hoE 'electron[@":][^0-9]*[0-9]+\.[0-9.]+' "${_lock}" 2>/dev/null | grep -oE '[0-9]+\.[0-9.]+' | head -1 | sed 's/\..*//')
			[[ -n ${_v} ]] && break
		done < <(find "$(_get_project_dir)" -maxdepth 2 -type f \
			\( -name 'bun.lock*' -o -name 'package-lock.json' -o -name 'pnpm-lock.yaml' -o -name 'yarn.lock' \) \
			! -path '*/node_modules/*' 2>/dev/null)
	fi
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
_set_bun_build_env() {
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export BUN_INSTALL_CACHE_DIR="${HOME}/.bun/cache"
	export BUN_INSTALL_GLOBAL_DIR="${HOME}/.bun/global"
	export BUN_INSTALL_BIN="${HOME}/.bun/bin"
	export BUN_CONFIG_SKIP_SAVE_LOCKFILE=1
	export BUN_CONFIG_SKIP_LOAD_LOCKFILE=1
	export BUN_DISABLE_DOTENV=1
	export DO_NOT_TRACK=1
	export BUN_JOBS="$(nproc)"
	mkdir -p "${HOME}" "${BUN_INSTALL_CACHE_DIR}" "${BUN_INSTALL_GLOBAL_DIR}" "${BUN_INSTALL_BIN}"
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
		sed -i "/packagerConfig:[[:space:]]*{/a\\    electronZipDir: '${_zd}',\\n    overwrite: true," "${_cfg}"
	done
}
prepare() {
    cd "$(_get_project_dir)" || return 1
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_electron_build_env
    _set_bun_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    export NODE_ENV=development
    bun install
    [[ "$(_get_project_dir tool)" == "electron-forge" ]] && _use_local_electron_for_forge
}
build() {
    cd "$(_get_project_dir)" || return 1
    _ensure_local_nvm
    _set_electron_build_env
    _set_bun_build_env
    export NODE_ENV=production
    case "$(_get_project_dir tool)" in
        electron-forge) bun run package ;;
        electron-builder) bun run build && bunx electron-builder --linux dir ;;
        electron-packager) bunx electron-packager . --platform=linux --arch=x64 --out=out --overwrite ;;
        *) echo "ERROR: no supported electron packaging tool detected" >&2; return 1 ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "$(_get_project_dir)/public/assets/electron.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
