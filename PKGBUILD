# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mediago-git
_pkgname=MediaGo
pkgver=3.5.0.r20.g1aa2bcd
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="Video online extraction tool streaming media download, video download,m3u8 download,Bilibili video download.视频在线提取工具,流媒体下载,视频下载,m3u8下载,B站视频下载."
arch=('x86_64')
url="https://downloader.caorushizi.cn/"
_ghurl="https://github.com/caorushizi/mediago"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'bbdown-bin'
    'ffmpeg'
    'aria2'
    'yt-dlp'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'curl'
    'pnpm'
    'jq'
    'go'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
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
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname//-/.}/apps/electron/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
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
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
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
        export CGO_ENABLED=1
        export GO111MODULE=on
        export GOOS=linux
        export GOCACHE="${srcdir}/go-build"
        export GOMODCACHE="${srcdir}/go/pkg/mod"
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export GOPROXY=https://goproxy.cn,direct
        }
    fi
    _ensure_local_nvm
    sed -i -e "
        /darwin: \"darwin\",/d
        /win32: \"win32\",/d
    " scripts/download-deps.ts
    sed -i "s/target\: \"deb\"\,/target\: \"dir\"\,/g" apps/electron/scripts/build.ts
    find apps/electron/src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" apps/electron/package.json
    go install github.com/swaggo/swag/cmd/swag@latest
    NODE_ENV=development    pnpm install
    NODE_ENV=development    pnpm deps:download
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    NODE_ENV=production     pnpm release:electron
    ln -sf "/usr/bin/aria2c" "${srcdir}/${pkgname//-/.}/apps/electron/release/linux-unpacked/resources/deps/aria2c"
    ln -sf "/usr/bin/BBDown" "${srcdir}/${pkgname//-/.}/apps/electron/release/linux-unpacked/resources/deps/BBDown"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/${pkgname//-/.}/apps/electron/release/linux-unpacked/resources/deps/ffmpeg"
    ln -sf "/usr/bin/yt-dlp" "${srcdir}/${pkgname//-/.}/apps/electron/release/linux-unpacked/resources/deps/yt-dlp"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "${srcdir}/${pkgname//-/.}/apps/electron/release/linux-unpacked/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${pkgname//-/.}/apps/electron/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
