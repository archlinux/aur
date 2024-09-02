# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mediago-git
_pkgname=MediaGo
pkgver=3.0.0.beta.0.r0.gcb814db
_electronversion=30
_nodeversion=20
pkgrel=1
pkgdesc="视频在线提取工具 流媒体下载 m3u8下载"
arch=('x86_64')
url="https://downloader.caorushizi.cn/"
_ghurl="https://github.com/caorushizi/mediago"
license=("MIT")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'gcc'
    'cmake'
    'curl'
    'pnpm'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-git}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "/\"electron\": /d;50i\    \"electron\": \"${SYSTEM_ELECTRON_VERSION}\"," -i packages/main/package.json
    sed "s|icon.icns|icon.png|g;s|deb|dir|g" -i packages/main/scripts/config.ts
    NODE_ENV=development    pnpm install
    NODE_ENV=production     pnpm run release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/packages/main/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/packages/main/release/linux-"*/resources/{app.asar.unpacked,bin,plugin} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/packages/main/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}