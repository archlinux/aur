# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=folo-git
_pkgname=Folo
pkgver=1.15.0.r16.g0dca01f
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="Organizes content into one timeline, keeping you updated on what matters, noise-free. Share lists, explore collections, and enjoy distraction-free browsing."
arch=('any')
url="https://app.folo.is/"
_ghurl="https://github.com/RSSNext/Folo"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'git'
    'pnpm'
    'python-setuptools'
    'jq'
    'zip'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
pkgver() {
    cd "$(_get_project_dir)"
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/mobile\@//g;s/desktop@//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
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
_use_local_electron_for_forge() {
    local _v="${SYSTEM_ELECTRON_VERSION}"
    local _zd="${srcdir}/electron-zips"
    case "${CARCH}" in
        aarch64)    _arch=arm64 ;;
        x86_64)     _arch=x64   ;;
    esac
    local _zf="${_zd}/electron-v${_v}-linux-${_arch}.zip"
    install -Dm755 -d "${_zd}"
    ( cd "${ELECTRON_DIST}" && zip -r -q -0 "${_zf}" . )
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
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    jq 'del(.scripts.prepare)' package.json > package.json.tmp && mv package.json.tmp package.json
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '
        .devDependencies.electron = $ver |
        .scripts |= with_entries(if .value == "electron-forge make" then .value = "electron-forge package" else . end)
    ' apps/desktop/package.json > package.json.tmp && mv package.json.tmp apps/desktop/package.json
    cp apps/desktop/.env.example apps/desktop/.env
    export NODE_ENV=development
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    pnpm install
    _use_local_electron_for_forge
}
build() {
    cd "$(_get_project_dir)/apps/desktop"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    pnpm update:main-hash   
    pnpm build:electron-vite
    pnpm build:electron-forge
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/apps/desktop/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
