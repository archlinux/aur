# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aihub
_pkgname=AIHub
pkgver=1.3.7
_electronversion=29
pkgrel=1
pkgdesc="A collection of large model capabilities, AI capabilities Electron client, with a minimalist interface, will support more AI capabilities in the future.一款集合众多大模型能力、AI能力的Electron客户端，具有极简的界面，将在未来支持更多AI能力."
arch=('any')
url="https://github.com/classfang/AIHub"
license=('Apache-2.0')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nodejs'
    'gendesk'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    else
        echo "Your network is OK."
    fi
    sed "s|--linux|--dir|g" -i package.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644  "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}