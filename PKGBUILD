# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tailchat-desktop
pkgver=1.10.0
_electronversion=18
pkgrel=1
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
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Network" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}/client/desktop"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn build
    yarn electron-builder --linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/client/desktop/release/build/linux-unpacked/resources/app.asar" \
        -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/client/desktop/release/build/linux-unpacked/resources/"{app.asar.unpacked,assets} \
        "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/client/desktop/release/build/linux-unpacked/swiftshader/"* \
        -t "${pkgdir}/usr/lib/${pkgname}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/client/desktop/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}