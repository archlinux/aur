# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imfile
_pkgname=imFile
_flathubname="io.github.${pkgname}_io.${pkgname}_desktop"
pkgver=2.1.0
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="A full-featured download manager.Forked from motrix.(Use system-wide electron)"
arch=(
    'aarch64'
    'armv7l'
    'x86_64'
)
url="https://imfile.org/"
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
    'curl'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('9af0e77385f333dc9c245cac90963a7b209db142c990e94357756c8efc9b7cc6'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export electronDist="/usr/lib/electron${_electronversion}"
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
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    _set_build_env
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
    sed -i "s/Icon=${_flathubname}/Icon=${pkgname}/g" "build/flathub/${_flathubname}.desktop"
    sed -i "s/${_flathubname}/${pkgname}/g" "build/flathub/${_flathubname}.metainfo.xml"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        sed -i 's|asset\.browser_download_url|"https://gh-proxy.com/" + asset.browser_download_url|g' scripts/sync-go-aria2.mjs
    fi
    NODE_ENV=development    pnpm install --frozen-lockfile
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     pnpm run sync-go-aria2
    NODE_ENV=production     pnpm -c exec "node .electron-vue/build.js"
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} --config=electron-builder.json"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/flathub/${_flathubname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/flathub/${_flathubname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
