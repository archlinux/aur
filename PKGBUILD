# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bear-graph
_pkgname="Bear Graph"
pkgver=1.0.0
_electronversion=25
_nodeversion=18
pkgrel=8
pkgdesc="Graph view of notes from Bear.app"
arch=('any')
url="https://github.com/Chuckleroot/bear-graph"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'cmake'
    'gcc'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('6ef3680559da0f83c595e2f9043bbcabf362c8e031ba73096ed2bc7adedbd2cc'
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
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
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
    NODE_ENV=development npm install
    NODE_ENV=production npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/out/${_pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}