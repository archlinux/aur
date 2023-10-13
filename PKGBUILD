# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=net-player
_pkgname=netPlayer
pkgver=1.2.1
pkgrel=2
pkgdesc="A Subsonic based music player.基于Subsonic API的桌面端播放器"
arch=('x86_64')
url="https://github.com/Zhoucheng133/net-player"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron13')
makedepends=('yarn' 'gendesk' 'npm' 'nodejs')
optdepends=('nvm: change nodejs version to 16')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('55bcb36d3ab0c8df4ce86819b5571886d9fc21ef37a854baee05f3d746598e2d'
            '7b6374122f4636333d7a08764893c44fbd48c2eb8adc101001b6c21ec436d781')
prepare() {
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e "s|mac|linux|g" -e "s|zip|AppImage|g" -e "s|, 'arm64'||g" -i vue.config.js
    yarn
    yarn electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}