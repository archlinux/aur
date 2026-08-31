# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mineradio-vision-git
_pkgname=Mineradio-Vision
pkgver=3.0.1.r5.gfffe29d
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="Learning-purpose fork of Mineradio with Kugou/Qishui/Spotify integration, LiquidGlass visuals and modular architecture.(Use system-wide electron)"
arch=('any')
url="https://github.com/moli-lihuashi/Mineradio-Vision"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'bun'
    'nvm'
    'git'
    'curl'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${url}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_OVERRIDE_DIST_PATH="${electronDist}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export BUN_CONFIG_REGISTRY="https://registry.npmmirror.com"
        export npm_config_registry="https://registry.npmmirror.com"
        export BUN_INSTALL_DISABLE_DEFAULT_REGISTRY_FALLBACK=1
        export npm_config_nodejs_org_mirror="https://npmmirror.com/mirrors/node"
        export NVM_NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron"
        export npm_config_electron_mirror="https://npmmirror.com/mirrors/electron/"
        export BUN_BINARY_MIRROR_OVERRIDE="https://npmmirror.com/-/binary/"
        export RUSTUP_DIST_SERVER="https://mirrors.aliyun.com/rustup"
		export RUSTUP_UPDATE_ROOT="https://mirrors.aliyun.com/rustup/rustup"
        rm -rf package-lock.json
    fi
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname%-Vision}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i -e "
        s/\"asar\"\: false\,/\"asar\"\: true\,/g
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
    " package.json
    # Fix Windows-only ANGLE backend (d3d11) for Linux compatibility
    sed -i "s/\['use-angle', 'd3d11'\]/['use-angle', 'gl']/g" desktop/main.js
    # Fix Linux taskbar icon: use PNG instead of ICO, and set proper appUserModelId
    sed -i "s|const APP_ICON_ICO = path.join(__dirname, '..', 'build', 'icon.ico');|const APP_ICON_ICO = path.join(__dirname, '..', 'build', 'icon.png');|g" desktop/main.js
    sed -i "s/const APP_USER_MODEL_ID = _BETA_META.appUserModelId || 'com.mineradio.desktop';/const APP_USER_MODEL_ID = '${pkgname%-git}';/g" desktop/main.js
    bun install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _set_build_env
    _ensure_local_nvm
    bunx electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
