# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=splayer-git
_pkgname=SPlayer
pkgver=3.1.1.r0.g28b76ba
_electronversion=41
_nodeversion=22
pkgrel=1
pkgdesc="A minimalist music player.(Use system-wide electron) 一个简约的音乐播放器，支持逐字歌词，下载歌曲，展示评论区，音乐云盘及歌单管理，音乐频谱，移动端基础适配 | 网易云音乐."
arch=('any')
url="http://splayer.imsyy.top"
_ghurl="https://github.com/imsyy/SPlayer"
license=("AGPL-3.0-only")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'libvips'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'curl'
    'pnpm'
    'jq'
    'rustup'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
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
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export CARGO_HOME="${srcdir}/.cargo"
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
            export RUSTUP_DIST_SERVER="https://rsproxy.cn"
		    export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
        }
    fi
    _ensure_local_nvm
    if [ ! -f .env ]; then
        cp .env.example .env
    else
        echo ".env file already exists. Skipping the copy step."
    fi
    rustup default stable
    find electron -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    pnpm remove --save-dev @electron-toolkit/utils
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install
    NODE_ENV=development    pnpm add -w object-inspect side-channel-list side-channel-map side-channel-weakmap
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     pnpm run build
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} --config electron-builder.config.ts"
    rm -rf "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/app.asar.unpacked/node_modules/font-list/libs/{darwin,win32}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16x16 32x32 96x96 192x192 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/public/icons/favicon-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
