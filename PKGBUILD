# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=folo-git
_pkgname=Folo
pkgver=1.14.0.r5.g141567e
_electronversion=43
_nodeversion=22
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
    'curl'
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
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
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
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    _ev="$(electron${_electronversion} -v)"
    export SYSTEM_ELECTRON_VERSION="${_ev#v}"
    export HOME="${srcdir}/.electron-gyp"
    mkdir -p "${HOME}"
    export XDG_CACHE_HOME="${srcdir}/.cache"
    export XDG_CONFIG_HOME="${srcdir}/.config"
    export XDG_DATA_HOME="${srcdir}/.local/share"
    export XDG_STATE_HOME="${srcdir}/.local/state"
    export PNPM_HOME="${srcdir}/.pnpm/bin"
    export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
    export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
    export PNPM_GLOBAL_DIR="${srcdir}/.pnpm/global"
    export PNPM_STATE_DIR="${srcdir}/.pnpm/state"
    export PNPM_MINIMUM_RELEASE_AGE=0
    export PNPM_NODE_LINKER=hoisted
    export PNPM_FETCH_RETRIES=3
    export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
    export PNPM_UPDATE_NOTIFIER=false
    export PNPM_NO_COLOR=true
    export PNPM_NO_PROGRESS=true
    export pnpm_config_platform=linux
    export pnpm_config_arch="${CARCH}"
    export NODE_OPTIONS="--max-old-space-size=4096"
    export npm_config_node_options="--max-old-space-size=4096"
    mkdir -p "${PNPM_CACHE_DIR}" "${PNPM_STORE_DIR}" "${PNPM_GLOBAL_DIR}" "${PNPM_HOME}" "${PNPM_STATE_DIR}"
    export PATH="${PNPM_HOME}:${PATH}"
    local _pnpmver="${_pnpmversion}"
    if [[ -z "${_pnpmver}" ]]; then
        _pnpmver="$(node -p "const pm=require('./package.json').packageManager; pm && pm.startsWith('pnpm@') ? pm.split('@')[1] : ''" 2>/dev/null)"
    fi
    if [[ -n "${_pnpmver}" ]]; then
        export COREPACK_HOME="${srcdir}/.corepack"
        install -dm755 "${srcdir}/.bin"
        corepack enable --install-directory "${srcdir}/.bin"
        export PATH="${srcdir}/.bin:${PATH}"
        corepack prepare "pnpm@${_pnpmver}" --activate
    fi
}
_use_local_electron_for_forge() {
    local _v="${SYSTEM_ELECTRON_VERSION}"
    local _zd="${srcdir}/electron-zips"
    case "${CARCH}" in
        aarch64)    _arch=arm64 ;;
        x86_64) _arch=x64   ;;
    esac
    local _zf="${_zd}/electron-v${_v}-linux-${_arch}.zip"
    install -Dm755 -d "${_zd}"
    ( cd "${ELECTRON_DIST}" && zip -r -q -0 "${_zf}" . )
    sed -i "/packagerConfig:[[:space:]]*{/a\\    electronZipDir: '${_zd}'," "${srcdir}/${pkgname//-/.}/apps/desktop/forge.config."*
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
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
    sed -i -e "
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
        s/electron-forge make/electron-forge package/g
    " apps/desktop/package.json
    cp apps/desktop/.env.example apps/desktop/.env
    export NODE_ENV=development
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    pnpm install
    _use_local_electron_for_forge
}
build() {
    cd "${srcdir}/${pkgname//-/.}/apps/desktop"
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
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    install -Dm644 "${srcdir}/${pkgname//-/.}/apps/desktop/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
