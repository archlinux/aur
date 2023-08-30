# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mqttx-git
_pkgname=MQTTX
pkgver=r1352.6d9a1db
pkgrel=1
pkgdesc="A cross-platform MQTT 5.0 client tool open sourced by EMQ"
arch=('any')
url="https://mqttx.app/"
_githuburl="https://github.com/emqx/MQTTX"
license=('Apache')
makedepends=('npm' 'git' 'nodejs>=16.0.0' 'gendesk' 'yarn')
depends=('bash' 'electron13')
source=("${pkgname//-/.}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'f81607b1e13ca358f24f7fa430d8a939462a78baf7d7daa3f3801733ee6ab57c')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    yarn install
    sed '106,108d' -i vue.config.js
    yarn run electron:build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    if [ "${CARCH}" = x86_64 ];then
        install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-git}/${pkgname%-git}.asar"
    elif [ "${CARCH}" = aarch64 ];then
        install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-arm64-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-git}/${pkgname%-git}.asar"
    fi
    install -Dm644 "${srcdir}/${pkgname//-/.}/public/icons/app.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    gendesk -f -n --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}