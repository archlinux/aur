# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lynxhub-git
_pkgname=LynxHub
pkgver=3.5.0.r2.g991593c
_electronversion=40
_nodeversion=24
pkgrel=1
pkgdesc="Manage and launch all your AI from a single dashboard.(Use system-wide electron)"
arch=('any')
url="https://github.com/KindaBrazy/LynxHub"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'libsecret'
    'python'
    'nodejs'
)
makedepends=(
    'npm'
    'git'
    'gendesk'
    'nvm'
    'curl'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${url}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/V//g' ||
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
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	local HOME="${srcdir}/.electron-gyp"
	export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
	export NPM_CONFIG_MAXSOCKETS=32
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
			export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
			export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
			export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
			export ELECTRON_BUILDER_BINARIES_MIRROR="https://npmmirror.com/mirrors/electron-builder-binaries/"
		}
		find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
	fi
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    # Fix incorrect import path for patreonAuth
    sed -i "s|./monitoring/patreonAuth|./monitoring/patreon_auth|g" src/main/index.ts
    # Fix dev extension import path that doesn't exist in production build
    sed -i '33,36s/^/\/\/ /' src/main/plugins/extensions/index.ts
    # Fix dev module import path that doesn't exist in production build
    sed -i '123,131s/^/\/\/ /' src/main/plugins/modules/index.ts
    # Fix HTML file names in electron.vite.config.ts
    sed -i 's/context_menu.html/contextMenu.html/g' electron.vite.config.ts
    sed -i 's/share_screen.html/shareScreen.html/g' electron.vite.config.ts
    sed -i 's/link_preview.html/linkPreview.html/g' electron.vite.config.ts
    # Fix HeroUI package names
    sed -i 's/@heroui-v3\//@heroui\//g' electron.vite.config.ts
    # Fix path aliases to match actual directory names
    sed -i 's/src\/renderer\/main_window/src\/renderer\/mainWindow/g' electron.vite.config.ts
    # Fix dev extension renderer import path that doesn't exist in production build
    sed -i '59,67s/^/\/\/ /' src/renderer/mainWindow/plugins/extensions/index.ts
    # Fix dev module renderer import path that doesn't exist in production build
    sed -i '396,404s/^/\/\/ /' src/renderer/mainWindow/plugins/modules/index.ts
    sed -i '405,423s/^/\/\/ /' src/renderer/mainWindow/plugins/modules/index.ts
    # Fix dev module import in ModuleConfigModal that doesn't exist in production build
    sed -i '65,72s/^/\/\/ /' src/renderer/mainWindow/pages/plugins/ModuleConfigModal.tsx
    sed -i '73,102s/^/\/\/ /' src/renderer/mainWindow/pages/plugins/ModuleConfigModal.tsx
    # Fix InfoModal import path case sensitivity
    sed -i 's|./about/infoModal|./about/InfoModal|g' src/renderer/mainWindow/components/card/menu/Installed.tsx
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm run build
    # Fix output file name mismatch
    mv out/main/index.js out/main/index.cjs
    case "${CARCH}" in
        aarch64)
            _CFG_FILE="electron-builder_arm.config.cjs"
            ;;
        x86_64)
            _CFG_FILE="electron-builder_x64.config.cjs"
            ;;
    esac
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config ${_CFG_FILE}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname//-/.}/build/icons/512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
