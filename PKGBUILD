# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
_appname=nuclear
pkgname="${_appname}-player"
_pkgname='Nuclear Player'
pkgver=1.43.0
_nodeversion=24
pkgrel=1
pkgdesc="Streaming music player that finds free music for you."
arch=('any')
url="https://nuclearplayer.com/"
_ghurl="https://github.com/nukeop/nuclear"
license=('AGPL-3.0-only')
depends=(
    'webkit2gtk-4.1'
    'libsoup3'
    'gtk3'
    'wavpack'
    'gst-plugins-good'
)
makedepends=(
    'pnpm'
    'nvm'
    'curl'
    'rustup'
)
optdepends=(
    'gst-plugins-bad: Additional media codec support'
    'gst-plugins-ugly: Patented codec support'
    'gst-libav: FFmpeg-based codec support'
)
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/player@${pkgver}.tar.gz")
sha256sums=('45405ecccf78af75cca5df3b20d05273521208e2b8ed571e85dab381d6f9074e')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
    export HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
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
            export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
            export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        }
    fi
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    sed -i -e "
        s/Exec=nuclear-music-player/Exec=${pkgname}/g
        s/Icon=com.nuclearplayer.Nuclear/Icon=${pkgname}/g
    " packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.desktop
    sed -i "s/com.nuclearplayer.Nuclear/${pkgname}/g" packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.metainfo.xml
    sed -i -e "
        s/\"active\"\: true\,/\"active\"\: false\,/g
        s/${_appname}-music-player/${pkgname}/g
    " packages/player/src-tauri/tauri.conf.json
    NODE_ENV=development    pnpm add -D node-addon-api node-gyp
    NODE_ENV=development    pnpm install --no-frozen-lockfile
    rustup default stable
}
build() {
    _set_build_env
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}-${pkgver}/packages/model"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/website"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/i18n"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/themes"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/hifi"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/ui"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/plugin-sdk"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/storybook"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/player"
    NODE_ENV=production     pnpm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
