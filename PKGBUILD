# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ai-browser-git
_pkgname=AI-Browser
pkgver=1.7.0.r0.gb9a08cc
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc='Client app for ChatGPT, Gemini, Claude, Phind, Perplexity, Genspark and Google AI Studio with Monaco Editor integration.(Use system-wide electron)'
arch=('any')
url="https://jun-murakami.web.app/#aiBrowser"
_ghurl="https://github.com/Jun-Murakami/AI-Browser"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'python'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'curl'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
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
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    # Remove existing node_modules and package-lock.json to ensure clean state
    rm -rf node_modules package-lock.json
    # Fix vite version in package.json for electron-vite@5.0.0 compatibility
    sed -i 's/"vite": "\^8\.[0-9]*\.[0-9]*"/"vite": "^6.0.0"/g' package.json
    sed -i 's/"@vitejs\/plugin-react": "\^6\.[0-9]*\.[0-9]*"/"@vitejs\/plugin-react": "^4.0.0"/g' package.json
    NODE_ENV=development    npm add -D node-gyp
    NODE_ENV=development    npm install --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production NODE_OPTIONS="--max-old-space-size=4096" npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config electron-builder.yml"
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/${pkgname%-git}.git/dist/linux-"*"/resources/app.asar.unpacked/node_modules/@homebridge/node-pty-prebuilt-multiarch/prebuilds/"{linux-arm,linux-ia32,linux-x64}
            ;;
        armv7h)
            rm -rf "${srcdir}/${pkgname%-git}.git/dist/linux-"*"/resources/app.asar.unpacked/node_modules/@homebridge/node-pty-prebuilt-multiarch/prebuilds/"{linux-arm64,linux-ia32,linux-x64}
            ;;
        i686)
            rm -rf "${srcdir}/${pkgname%-git}.git/dist/linux-"*"/resources/app.asar.unpacked/node_modules/@homebridge/node-pty-prebuilt-multiarch/prebuilds/"{linux-arm*,linux-x64}
            ;;
        x86_64)
            rm -rf "${srcdir}/${pkgname%-git}.git/dist/linux-"*"/resources/app.asar.unpacked/node_modules/@homebridge/node-pty-prebuilt-multiarch/prebuilds/"{linux-arm*,linux-ia32}
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}