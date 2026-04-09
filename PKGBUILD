# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imfile
_pkgname=imFile
pkgver=2.0.4
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="A full-featured download manager.Forked from motrix.(Use system-wide electron)"
arch=(
    'aarch64'
    'armv7l'
    'x86_64'
)
url="https://imfile.io/"
_ghurl="https://github.com/imfile-io/imfile-desktop"
license=('MIT')
conflicts=(
    "${pkgname}"
    "${pkgname}-electron"
    'motrix'
)
provides=('motrix')
depends=(
    "electron${_electronversion}"
    'aria2'
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
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('02115f86c7c48b27d2101b3dd883b7215ee2f8ac5824293b4b78598e60cec743'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
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
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
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
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            # Use proxy for GitHub API and downloads in sync-go-aria2 script
            sed -i "s|https://api.github.com/|https://wget.la/https://api.github.com/|g" scripts/sync-go-aria2.mjs
            sed -i "s|https://github.com/|https://wget.la/https://github.com/|g" scripts/sync-go-aria2.mjs
        }
    fi
    _ensure_local_nvm
    case "${CARCH}" in
        aarch64)
            _replace_dir_name=arm64
            ;;
        armv7h)
            _replace_dir_name=armv7l
            ;;
        x86_64)
            _replace_dir_name=x64
            ;;
    esac
    ln -sf "/usr/bin/aria2c" "${srcdir}/${pkgname}-${pkgver}/extra/linux/${_replace_dir_name}/engine/aria2c"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/'darwin', 'win32', 'linux'/'linux'/g" scripts/sync-go-aria2.mjs
    NODE_ENV=development    pnpm install --frozen-lockfile
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     pnpm run sync-go-aria2
    NODE_ENV=production     pnpm -c exec "node .electron-vue/build.js"
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} --config=electron-builder.json"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	find "${srcdir}/${pkgname}-${pkgver}/release/linux-"*"/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" {} +
    if find "${srcdir}/${pkgname}-${pkgver}/release/linux-"*"/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname}-${pkgver}/release/linux-"*"/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
