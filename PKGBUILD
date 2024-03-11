# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=houdunren-camera
pkgver=1.0.83
_electronversion=25
pkgrel=2
pkgdesc="Desktop camera software that can be used for online live streaming, distance learning, and video conferencing.桌面摄像头软件，可用于在线直播、远程教学、视频会议"
arch=('any')
url="https://www.houdunren.com/"
_ghurl="https://github.com/houdunwang/camera"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
mkdenpends=(
    'nodejs'
    'pnpm'
    'gendesk'
    'npm'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
    echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
    echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    sed '/- snap/d;/- deb/d' -i electron-builder.yml
    pnpm install
    pnpm run build:linux
    cp "${srcdir}/${pkgname}.git/dist/.icon-set/icon_16x16.png" "${srcdir}/${pkgname}.git/dist/.icon-set/icon_16.png"
    cp "${srcdir}/${pkgname}.git/dist/.icon-set/icon_48x48.png" "${srcdir}/${pkgname}.git/dist/.icon-set/icon_48.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar.unpacked/resources/* \
        -t "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/resources"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/dist/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}