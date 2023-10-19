# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mqttx-git
_pkgname=MQTTX
pkgver=1.9.6.r13.g668cec8
pkgrel=1
pkgdesc="A cross-platform MQTT 5.0 client tool open sourced by EMQ"
arch=('aarch64' 'x86_64')
url="https://mqttx.app/"
_githuburl="https://github.com/emqx/MQTTX"
license=('Apache')
makedepends=('npm' 'git' 'nodejs>=16.0.0' 'gendesk' 'yarn')
depends=('bash' 'electron13')
source=("${pkgname//-/.}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '7841f9fbf8cc9d9e21285b148fab6a92d6dc58c42856d15dbf3b2b3d3fcf80ef')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "%s" "$(git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')"
}
build() {
    gendesk -f -n -q --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-/.}"
    sed -e "/target: 'deb'/d" -e "/target: 'rpm'/d" -e "/target: 'snap'/d" -i vue.config.js
    yarn
    yarn run electron:build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    if [ "${CARCH}" = x86_64 ];then
        install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
        install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-unpacked/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-git}/swiftshader"
    elif [ "${CARCH}" = aarch64 ];then
        install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-arm64-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
        install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-arm64-unpacked/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-git}/swiftshader"
    fi
    install -Dm644 "${srcdir}/${pkgname//-/.}/public/icons/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}