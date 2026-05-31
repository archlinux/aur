# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simpleshell-git
_pkgname=SimpleShell
pkgver=0.4.25.r2.g2786a97
_electronversion=40
_nodeversion=22
pkgrel=1
pkgdesc="A Simple Terminal based on Electron & NodeJS.(Use system-wide electron)"
arch=('any')
url="https://github.com/funkpopo/simpleshell"
license=('Apache-2.0')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'yarn'
    'nvm'
    'git'
    'curl'
    'gendesk'
    'npm'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
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
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    rm -rf bunfig.toml bun.lockb || true
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
        export BUN_REGISTRY_MIRROR="https://registry.npmmirror.com"
        export BUN_BINARY_MIRROR_OVERRIDE="https://registry.npmmirror.com/-/binary/"
        export BUN_INSTALL_REWRITE="https://registry.npmjs.org/*=https://registry.npmmirror.com/\$1"
        export BUN_INSTALL_NO_CACHE=1
        export BUN_INSTALL_DISABLE_DEFAULT_REGISTRY_FALLBACK=1
        export BUN_CACHE_DIR="${srcdir}/.bun_cache"
    fi
    #sed -i "s/logo.ico/${_pkgname}.png/g" src/main.js
    #sed -i "3i\const configDir = process.env.XDG_CONFIG_HOME || path.join(require('os').homedir(), '.config');" src/core/configManager.js
    #sed -i "3i\const configDir = process.env.XDG_CONFIG_HOME || path.join(require('os').homedir(), '.config');" src/core/utils/logger.js
    #sed -i 's/return path.join(path.dirname(app.getPath("exe")), "config.json");/return path.join(configDir, "simpleshell", "config.json");/g' src/core/configManager.js
    #sed -i 's/return path.join(path.dirname(process.execPath), "log");/return path.join(configDir, "simpleshell", "log");/g' src/core/utils/logger.js
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    bun install
    bun add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \'${electronDist}\',\\
        },\\
    }," forge.config.*
    NODE_ENV=development    bun run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname//-/.}/src/assets/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
