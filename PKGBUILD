# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=net-player
_pkgname="${pkgname//-p/P}"
pkgver=1.3.1
pkgrel=1
pkgdesc="A Subsonic based music player.基于Subsonic API的桌面端播放器"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Zhoucheng133/net-player"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron13'
)
makedepends=(
    'yarn'
    'gendesk'
    'npm'
    'nvm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'cf30b550beac6dfd1582048dd68b57c8d9f5404561357b731dedfac3559dcf56')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e "s|mac|linux|g" -e "s|zip|AppImage|g" -i vue.config.js
    yarn --cache-folder "${srcdir}/npm-cache" 
    yarn electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    if [ "${CARCH}" == "aarch64" ];then
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-arm64-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-arm64-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    elif [ "${CARCH}" == "x86_64" ];then
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    fi
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}