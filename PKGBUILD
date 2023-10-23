# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=net-player
_pkgname=netPlayer
pkgver=1.2.2
pkgrel=1
pkgdesc="A Subsonic based music player.基于Subsonic API的桌面端播放器"
arch=('aarch64' 'x86_64')
url="https://github.com/Zhoucheng133/net-player"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron13')
makedepends=('yarn' 'gendesk' 'npm' 'nvm')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('b3021084c835df9f2790194599b74a3705cd59b6c595ad2566d0a20d7f3564d7'
            'e6dafc57db5aeae87f220d3070d53cd1491b465398d175d719c77df7b83d47f0')
_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e "s|mac|linux|g" -e "s|zip|AppImage|g" -i vue.config.js
    yarn
    yarn electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    if [ "${CARCH}" == "aarch64" ];then
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-arm64-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-arm64-unpacked/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-bin}/swiftshader"
    elif [ "${CARCH}" == "x86_64" ];then
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-unpacked/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-bin}/swiftshader"
    fi
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}