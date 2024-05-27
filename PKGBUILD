# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatd
pkgver=1.1.1
_electronversion=24
_nodeversion=18
pkgrel=1
pkgdesc="Chat with your documents using local AI"
arch=('any')
url="https://chatd.ai/"
_ghurl="https://github.com/BruceMacD/chatd"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
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
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('789bd164374216f68f70e1f4095c3be46163b687acd376cd2e25888d80912a88'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}/app/src/service/ollama/runners"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-"*/resources/app/* "${pkgdir}/usr/lib/${pkgname}/app"
    ln -sf "/usr/bin/ollama" "${pkgdir}/usr/lib/${pkgname}/app/src/service/ollama/runners/ollama-linux"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/${pkgname}.iconset/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}