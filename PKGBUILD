# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Butui Hu <hot123tea123@gmail.com>
pkgname=motrix-git
_debname="app.${pkgname%-git}.native"
_pkgname=Motrix
pkgver=2.0.0.beta.47.r3.g99a40ab
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="A full-featured download manager that supports downloading HTTP, FTP, BitTorrent, Magnet, etc."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://motrix.app/"
_ghurl="https://github.com/agalwood/Motrix"
_giteeurl="https://gitee.com/mirrors/motrix"
license=('MIT')
provides=("${pkgname%-git}=${pkgver}")
conflicts=(
    "${pkgname%-git}"
    "${pkgname%-git}-bin"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'git'
    'pnpm'
    'npm'
    'nvm'
    'jq'
    'rustup'
)
optdepends=(
    'ffmpeg'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
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
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
    export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${CARGO_HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
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
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    _set_build_env
    sed -i -e "
        s/Exec=start-${pkgname%-git}/Exec=${pkgname%-git}/g
        s/Icon=${_debname}/Icon=${pkgname%-git}/g
    " "flatpak/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-git}/g" "flatpak/${_debname}.metainfo.xml"
    # Replace process.resourcesPath with system-wide install path in source files
    # Only replace property access patterns, not string literals
    local _rp="'/usr/lib/${pkgname%-git}'"
    find src -type f -name '*.ts' -exec sed -i \
        -e "s|: process\.resourcesPath,|: ${_rp},|g" \
        -e "s|path\.join(process\.resourcesPath,|path.join(${_rp},|g" \
        -e "s|path\.join(process\.resourcesPath |path.join(${_rp} |g" \
        -e "s|(process\.resourcesPath |(${_rp} |g" \
        {} +
    rustup update stable
    rustup default stable
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    export	NODE_ENV=development
    export MOTRIX_SKIP_ENGINE_FETCH=1
    pnpm install
    node node_modules/electron/install.js
}
build() {
    cd "$(_get_project_dir)"
    _set_build_env
    _ensure_local_nvm
    case "${CARCH}" in
        x86_64)  _arch="x64" ;;
        aarch64) _arch="arm64" ;;
        armv7h)  _arch="armv7l" ;;
        *)       _arch="x64" ;;
    esac
    export	NODE_ENV=production
    pnpm run fetch:engine --platform linux --arch "${_arch}"
    pnpm run build:builtin
    case "${CARCH}" in
        x86_64)  rustup target add x86_64-unknown-linux-musl ;;
        aarch64) rustup target add aarch64-unknown-linux-musl ;;
    esac
    pnpm run build:native-host -- --platform linux --arch "${_arch}"
    pnpm run build:finalize-fs -- --platform linux --arch "${_arch}"
    pnpm run build:electron
    pnpm run stage:electron -- --platform linux --arch "${_arch}"
    pnpm exec electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir="$(_get_app_dir)"
	rm -rf "${_app_dir}/resources/default_app.asar"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    install -Dm644 "$(_get_project_dir)/flatpak/${_debname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "$(_get_project_dir)/flatpak/${_debname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
    install -Dm644 "$(_get_project_dir)/build/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
