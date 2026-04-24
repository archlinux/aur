# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clawx
_pkgname=ClawX
pkgver=0.3.11
_electronversion=40
_nodeversion=24
pkgrel=1
pkgdesc="A desktop app that provides a graphical interface for OpenClaw AI agents. It turns CLI-based AI orchestration into a desktop experience without using the terminal.(Use system-wide electron)"
arch=('any')
url="https://clawx.com.cn/"
_ghurl="https://github.com/ValueCell-ai/ClawX"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'pnpm'
    'nvm'
    'gendesk'
    'curl'
    'git'
    'jq'
)
options=(
    '!strip'
    'emptydirs'
)
source=("${pkgname}.sh")
sha256sums=('880ef52d7457bf1f5dbf07d01c04d47ea1c5df224c3c5136989aaecbc2dec6d6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname}-${pkgver}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}"
    if [[ ! -d "${pkgname}-${pkgver}" ]]; then
        git clone \
            --depth 1 \
            --branch "v${pkgver}" \
            "${_ghurl}" \
            "${pkgname}-${pkgver}"
    fi
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    {
        export PNPM_LINK_WORKSPACE_PACKAGES=true
        export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
        export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
        export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_VIRTUAL_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_SHAMEFULLY_HOIST=true
        export PNPM_VIRTUAL_STORE_DIR_MAX_LENGTH=80
        export PNPM_NODE_LINKER=hoisted
        export PNPM_NETWORK_CONCURRENCY=32
        export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NVM_NODEJS_ORG_MIRROR="https://registry.npmmirror.com/-/binary/node"
            export NODEJS_ORG_MIRROR="https://registry.npmmirror.com/-/binary/node"
        }
    fi
    _ensure_local_nvm
    find electron -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     pnpm exec node scripts/generate-ext-bridge.mjs
    NODE_ENV=production     pnpm run build:vite
    NODE_ENV=production     pnpm exec zx scripts/bundle-openclaw.mjs
    NODE_ENV=production     pnpm exec zx scripts/bundle-openclaw-plugins.mjs
    NODE_ENV=production     pnpm exec zx scripts/bundle-preinstalled-skills.mjs
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} -c.electronVersion=${SYSTEM_ELECTRON_VERSION} --config electron-builder.yml"
    local _arch_rem
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    case "${CARCH}" in
        aarch64) _arch_rem="*x64*" ;;
        x86_64)  _arch_rem="*arm64*" ;;
    esac
    find "${_app_dir}/resources" -type d \( \
        -name "*darwin*" -o \
        -name "*win32*" -o \
        -name "${_arch_rem}" \
    \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname}/"    
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
