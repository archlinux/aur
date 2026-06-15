# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili
_pkgver=1.17.9
_subver=1
pkgver="${_pkgver}_${_subver}"
_electronversion=28
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
sha256sums=('49380020a91a56fa64030a44eacda3c5a08ecdfb4e07f5d7edf8e6d9228c75f4'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.electronVersion' "${srcdir}/${pkgname}-${pkgver}/conf/build.json" | tr -d '^')
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
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
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
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        }
    fi
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
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}/${pkgname}-${pkgver}/app" -maxdepth 1 -type f -exec install -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/${pkgname}-${pkgver}/app" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname}-${pkgver}/app/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/res/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/res/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
