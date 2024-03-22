# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatd
pkgver=1.1.0
_electronversion=24
_nodeversion=18
pkgrel=3
pkgdesc="Chat with your documents using local AI"
arch=('any')
url="https://chatd.ai/"
_ghurl="https://github.com/BruceMacD/chatd"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}-bin"
    'ollama'
    'python>3'
    'nodejs'
    'libvips'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
    'gcc'
    'base-devel'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname}.git::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('45417323e096b5804d3cb77178226f2df028ed3fad5b0b77df2774b423b73a8a'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname} %U"
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
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}/app/src/service/ollama/runners"
    cp -r "${srcdir}/${pkgname}.git/out/${pkgname}-linux-"*/resources/app/* "${pkgdir}/usr/lib/${pkgname}/app"
    ln -sf "/usr/bin/ollama" "${pkgdir}/usr/lib/${pkgname}/app/src/service/ollama/runners/ollama-linux"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/${pkgname}.git/public/${pkgname}.iconset/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}