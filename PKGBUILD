# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=folo
_pkgname=Folo
pkgver=1.11.0
_electronversion=43
_nodeversion=22
pkgrel=1
pkgdesc="Organizes content into one timeline, keeping you updated on what matters, noise-free. Share lists, explore collections, and enjoy distraction-free browsing.(Prebuilt version.Use system-wide electron)"
arch=('any')
url="https://folo.is/"
_ghurl="https://github.com/RSSNext/Folo"
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'curl'
    'pnpm'
    'python-setuptools'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/desktop/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('d5a80bb2914010ce82108c9709b7e3f96b482601c107142f633c93195d99c2bb'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
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
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export pnpm_config_registry="https://registry.npmmirror.com"
            export npm_config_registry="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        }
    fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 4 -name "package.json" ! -name "node_modules" \
        -exec jq -r '.devDependencies.electron // empty' {} + 2>/dev/null | grep -v "^$" | head -n 1)
    _elec_ver=$(echo "${_elec_ver}" | sed 's/[^0-9.]//g')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${_pkgname}-desktop-v${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _set_build_env
    _ensure_local_nvm
    npm install -g node-addon-api node-gyp
    export NODE_PATH="$(npm root -g)"
    sed -i -e "
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
        s/electron-forge make/electron-forge package/g
    " apps/desktop/package.json
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${_pkgname}-desktop-v${pkgver}/apps/desktop"
    _set_build_env
    _ensure_local_nvm
    cp .env.example .env
    NODE_ENV=production     pnpm update:main-hash    
    NODE_ENV=production     pnpm build:electron-vite
    NODE_ENV=production     pnpm build:electron-forge
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${_pkgname}-desktop-v${pkgver}/apps/desktop/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-desktop-v${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-desktop-v${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
