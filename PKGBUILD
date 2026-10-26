# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cherry-studio-git
_pkgname="Cherry Studio"
pkgver=2.0.9.r1249.gc61386a
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="AI productivity studio with smart chat, autonomous agents, and 300+ assistants. Unified access to frontier LLMs."
arch=('any')
url="https://cherryai.com/"
_ghurl="https://github.com/CherryHQ/cherry-studio"
license=(
    'AGPL-3.0-or-later'
    'LicenseRef-custom'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'libevdev'
    'python'
    'python-yaml'
    'nodejs'
    'bun'
    'ripgrep'
    'uv'
    'mise'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'pnpm'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}.js"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '9417ba033cfc980d6723978dc5fca100cbec6da78e5494f9e64960e4efec8c21')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
	cd "$(_get_project_dir)"
	set -o pipefail
	git describe --long --tags --abbrev=7 --match '[0-9]*' --match 'v[0-9]*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
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
	export XDG_STATE_HOME="${HOME}/.local/state"
	export PNPM_HOME="${HOME}/.pnpm/bin"
	export pnpm_config_cache_dir="${HOME}/.pnpm_cache"
	export pnpm_config_store_dir="${HOME}/.pnpm_store"
	export pnpm_config_global_dir="${HOME}/.pnpm/global"
	export pnpm_config_state_dir="${HOME}/.pnpm/state"
	export pnpm_config_node_linker=hoisted
	export pnpm_config_minimum_release_age=0
	export pnpm_config_update_notifier=false
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	mkdir -p "${HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
	export PATH="${PNPM_HOME}:${PATH}"
	local _pnpmver=""
	local _pkgjson="$(_get_project_dir)/package.json"
	if [ -f "${_pkgjson}" ]; then
		_pnpmver="$(grep -o '"packageManager"[^,]*' "${_pkgjson}" 2>/dev/null | grep -oE 'pnpm@[^"+]+' | head -n1 | sed 's/^pnpm@//')"
		if [ -z "${_pnpmver}" ]; then
			_pnpmver="$(grep -oE '"pnpm"[[:space:]]*:[[:space:]]*"[^"]+"' "${_pkgjson}" 2>/dev/null | grep -oE '[0-9][0-9.]*' | head -n1)"
		fi
	fi
	if [ -n "${_pnpmver}" ]; then
		npm install -g "pnpm@${_pnpmver}" --prefix "${HOME}/.pnpm" \
			--registry "${COREPACK_NPM_REGISTRY}"
	fi
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh" "${srcdir}/${pkgname%-git}.js"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    export NODE_ENV=development
    sed -i '/^overrides:/a\  canvas: "3.2.3"' pnpm-workspace.yaml
    pnpm install --ignore-scripts
    pnpm run postinstall
    sed -i "s|return fs.readFileSync(versionPath, 'utf8').trim() === expectedVersion|return true|" scripts/download-binaries.js
    sed -i "s|if (marked !== tool.version) {|if (false) {|" scripts/download-binaries.js
    sed -i "s|if (process.platform !== 'win32') fs.chmodSync(filePath, 0o755)|if (process.platform !== 'win32') { try { fs.chmodSync(filePath, 0o755) } catch (_) {} }|" scripts/download-binaries.js
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    pnpm exec dotenv pnpm run build
    local _arch_name=$([[ "${CARCH}" == "aarch64" ]] && echo linux-arm64 || echo linux-x64)
    local _bindir="resources/binaries/${_arch_name}"
    for _bin in mise bun uv uvx rg; do
        install -m755 "/usr/bin/${_bin}" -t "${_bindir}"
    done
    local _mise_ver _bun_ver _uv_ver _rg_ver
    _mise_ver=$(grep -oP "const MISE_VERSION = '\K[^']+" scripts/download-binaries.js)
    _bun_ver=$(grep -oP "const BUN_VERSION = '\K[^']+" scripts/download-binaries.js)
    _uv_ver=$(grep -oP "const UV_VERSION = '\K[^']+" scripts/download-binaries.js)
    _rg_ver=$(grep -oP "const RG_VERSION = '\K[^']+" scripts/download-binaries.js)
    echo "${_mise_ver}" > "${_bindir}/.mise-version"
    echo "${_bun_ver}" > "${_bindir}/.bun-version"
    echo "${_uv_ver}" > "${_bindir}/.uv-version"
    echo "${_rg_ver}" > "${_bindir}/.rg-version"
    pnpm -c exec "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.yml"
    find "$(_get_app_dir)/resources" -type d -exec chmod 755 {} +
	local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
    rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    local _arch_name=$([[ "${CARCH}" == "aarch64" ]] && echo linux-arm64 || echo linux-x64)
    for _bin in bun rg uv uvx mise; do
        ln -sf "/usr/bin/${_bin}" "${pkgdir}/usr/lib/${pkgname%-git}/app.asar.unpacked/resources/binaries/${_arch_name}/${_bin}"
    done
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
