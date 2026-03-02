# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
_appname=nuclear
pkgname="${_appname}-player"
_pkgname='Nuclear Player'
pkgver=1.13.0
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
)
makedepends=(
    'pnpm'
    'nvm'
    'curl'
    'rustup'
)
source=("${pkgname}-${pkgver}::git+${_ghurl}#tag=player@${pkgver}")
sha256sums=('c0569b7569c918c8310f01325038f12d7be033fe34c1cccaff23a2f24d9dfd41')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export CARGO_HOME="${srcdir}/.cargo"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export RUSTUP_DIST_SERVER="https://rsproxy.cn"
        export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
    fi
    _ensure_local_nvm
    sed -i -e "
        s/Exec=nuclear-music-player/Exec=${pkgname}/g
        s/Icon=com.nuclearplayer.Nuclear/Icon=${pkgname}/g
    " packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.desktop
    sed -i "s/com.nuclearplayer.Nuclear/${pkgname}/g" packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.metainfo.xml
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" packages/player/src-tauri/tauri.conf.json
    NODE_ENV=development    pnpm install --frozen-lockfile
    rustup default stable
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}-${pkgver}/packages/model"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/website"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/i18n"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/hifi"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/packages/themes"
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
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/target/release/player" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/resources/com.nuclearplayer.Nuclear.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/player/src-tauri/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
