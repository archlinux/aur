# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili
_pkgver=1.17.9
_subver=2
pkgver="${_pkgver}_${_subver}"
_electronversion=43
_nodeversion=22
pkgrel=1
pkgdesc="Linux version based on Beilai official client porting supports roaming.(Use system-wide electron).基于哔哩哔哩官方客户端移植的Linux版本,支持漫游"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/msojocs/bilibili-linux"
license=('MIT')
provides=("${pkgname}")
conflicts=(
    "${pkgname}"
)
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    'libappindicator'
)
makedepends=(
    'wget'
    'perl-image-exiftool'
    'asar'
    'unzip'
    'p7zip'
    'curl'
    'npm'
    'nvm'
    'pnpm'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${_pkgver}-${_subver}"
    "${pkgname}.sh"
)
sha256sums=('0c3e136bcd5e0857e61ec81a6098d33c9bc3ff0da17827ac38ef2b8a60bec18e'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
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
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    _set_build_env
    sed -i "s/mkdir tmp/mkdir tmp \&\& cp ..\/..\/..\/.npmrc tmp/g" tools/fix-other.sh
    _ensure_local_nvm
    sed -i "s/\"electronVersion\": \"[^\"]*\"/\"electronVersion\": \"${SYSTEM_ELECTRON_VERSION}\"/g" conf/build.json
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    sh tools/update-bilibili.sh
    sh tools/fix-other.sh
    sh tools/extension.sh
    mv tmp/bili/resources/* app
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	cp -a "${srcdir}/${pkgname}-${pkgver}/app/"* "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/res/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/res/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
