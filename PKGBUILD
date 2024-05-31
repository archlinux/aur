# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=aero
pkgname="${_appname}-browser"
_pkgname="AeroBrowser"
pkgver=0.2.2_alpha
_electronversion=23
_nodeversion=18
pkgrel=5
pkgdesc="A fast and lightweight web browser made with electron and react that allows you to navigate the Internet with ease."
arch=('any')
url="https://aero-mymeiy532-frostbreker.vercel.app/"
_ghurl="https://github.com/FrostBreker/Aero"
license=('MIT')
conflicts=("${pkgname}")
provides=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'nvm'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('77b1cd25139304d506ed5477d2b224dc9352b157d32debb14bd5ad9773760388'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Network" --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
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
    sed "s|-l -c|-l --dir -c|g" -i package.json
    sed "s|https://www.google.fr/|about:blank|g" -i src/App.js
    npm install
    npm run electron:package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE.MD" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}