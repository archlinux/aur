# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tailchat-desktop
pkgver=1.10.0
_electronversion=18
_nodeversion=16
pkgrel=2
pkgdesc="Next generation noIM application in your own workspace, not only another Slack/Discord/Rocket.chat"
arch=('any')
url="https://tailchat.msgbyte.com/"
_ghurl="https://github.com/msgbyte/tailchat"
license=('Apache')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'libxcb'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'yarn'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Network" --name "${pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git/client/desktop"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run build
    yarn run electron-builder --linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/client/desktop/release/build/linux-"*/resources/app.asar \
        -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/client/desktop/release/build/linux-"*/resources/{app.asar.unpacked,assets} \
        "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/client/desktop/release/build/linux-"*/swiftshader/* \
        -t "${pkgdir}/usr/lib/${pkgname}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname}.git/client/desktop/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}