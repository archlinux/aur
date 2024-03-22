# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=perplexity-ai-app
pkgver=2.1.0
_electronversion=22
pkgrel=3
pkgdesc="The Unofficial Perplexity AI Desktop App, powered by Electron which brings the magic of AI language processing to your desktop."
arch=('any')
url="https://github.com/inulute/perplexity-ai-app"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nodejs'
    'gendesk'
    'git'
    'curl'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('875686f084c613d9a5d4dd71bcf60af81da62a141690c869a7e70b06bb65290f'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    else
        echo "Your network is OK."
    fi
    sed "s|AppImage|dir|g" -i package.json
    npm install --force
    npm run package-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}.git/release-builds/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}.git/assets/icons/png/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}