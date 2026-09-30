# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=podman-desktop-git
_pkgname='Podman Desktop'
_flatpakname="io.podman_desktop.${_pkgname// /}"
pkgver=r11447.c4129c0
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="A graphical tool for developing on containers and Kubernetes."
arch=('any')
url="https://podman-desktop.io/"
_ghurl="https://github.com/podman-desktop/podman-desktop"
license=('Apache-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'docker-compose'
    'podman'
    'docker'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'pnpm'
    'jq'
)
optdepends=(
    "crc: crc plugin"
    "lima: lima plugin"
    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
    "trash-cli: file deletion support (trash-put)"
    "libappindicator-gtk3: StatusNotifierItem support"
    "pipewire: WebRTC desktop sharing under Wayland"
    "qt5-base: enable Qt5 with --enable-features=AllowQt"
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
    cd "$(_get_project_dir)"
    set -o pipefail
    git fetch --tags
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _get_electron_version
    find packages -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/" {} +
    sed -i -e "
        s/run.sh/${pkgname%-git}/g
        s/${_flatpakname}/${pkgname%-git}/g
        /X-Flatpak/d
    " .flatpak.desktop
    sed -i "s/${_flatpakname}/${pkgname%-git}/" .flatpak-appdata.xml
    sed -i "s/\'flatpak\', \'tar.gz\'/\'dir\'/" .electron-builder.config.cjs
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=development
    pnpm add -D -w node-addon-api
    pnpm install --no-lockfile
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    for _target in main preload preload-docker-extension preload-webview preload:types ui renderer extensions; do
        pnpm run "build:${_target}"
    done
    pnpm -c exec "electron-builder build --linux dir -c.electronDist=${ELECTRON_DIST} --config .electron-builder.config.cjs --config.asar=false"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/.flatpak.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${_src}/buildResources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
    install -Dm644 "${_src}/buildResources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}