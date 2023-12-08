# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mqttx-git
_pkgname=MQTTX
pkgver=1.9.7.r0.gb1f0e3ff
_electronversion=13
pkgrel=1
pkgdesc="A cross-platform MQTT 5.0 client tool open sourced by EMQ"
arch=(
    'aarch64'
    'x86_64'
)
url="https://mqttx.app/"
_ghurl="https://github.com/emqx/MQTTX"
license=('Apache')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'yarn'
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    sed -e "/target: 'deb'/d" -e "/target: 'rpm'/d" -e "/target: 'snap'/d" -i vue.config.js
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run electron:build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    if [ "${CARCH}" = x86_64 ];then
        install -Dm644 "${srcdir}/${pkgname%-git}/dist_electron/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
        install -Dm644 "${srcdir}/${pkgname%-git}/dist_electron/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
    elif [ "${CARCH}" = aarch64 ];then
        install -Dm644 "${srcdir}/${pkgname%-git}/dist_electron/linux-arm64-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
        install -Dm644 "${srcdir}/${pkgname%-git}/dist_electron/linux-arm64-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
    fi
    install -Dm644 "${srcdir}/${pkgname%-git}/public/icons/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}