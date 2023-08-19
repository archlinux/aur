# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=net-player
pkgver=1.2.0
pkgrel=1
pkgdesc="A Subsonic based music player.基于Subsonic API的桌面端播放器"
arch=('any')
url="https://github.com/Zhoucheng133/net-player"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron13')
makedepends=('yarn' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('cd57ed5ba6d2295705cab3be1a16c7ead5d7e2616ae050c8382969ece28d321a'
            '9c4645c6ffdcf28c6e382b1f77430417fed20ff93dc423d6db00fcae0df95126')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn run electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "netPlayer" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}