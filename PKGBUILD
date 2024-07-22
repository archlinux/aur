# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peersky-browser
_pkgname="Peersky Browser"
pkgver=1.0.0_prerelease
_electronversion=20
_nodeversion=18
pkgrel=9
pkgdesc="A minimal p2p web browser."
arch=("any")
url="https://peersky.p2plabs.xyz/"
_ghurl="https://github.com/p2plabsxyz/peersky-browser"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'nodejs'
)
makedepends=(
    'npm'
    'gendesk'
    'gcc'
    'curl'
    'cmake'
    'git'
)
options=('!strip')
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('e27d276adb612c22e0299f978fffad3a0cc9040f424fe6965e3f91afd0df37dc'
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
        -e "s|@cfgdirname@|${pkgname}|g" \
        -e "s|@options@|ELECTRON_DISABLE_SECURITY_WARNINGS=true|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    _ensure_local_nvm
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
    sed "/openDevTools/d" -i src/main.js
    NODE_ENV=development npm install --force
    NODE_ENV=production npx electron-builder build -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/build/linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}