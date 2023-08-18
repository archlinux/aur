# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=creamplayer
_appname=Creamplayer
pkgver=4.0.1
pkgrel=1
pkgdesc="网易云播放/下载器,QQ音乐批量下载工具 Netease music and QQ music downloader and player"
arch=('any')
url="https://github.com/Beadd/Creamplayer"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'electron13')
makedepends=('npm' 'nodejs' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('b208011fc9efcec18e2f544f3e5093ace7a607478fbcac83a7031148146dddcb'
            '7a072bd2845becf96168ebf88b4e26ac8b4f1695f3a0d7426d083acc5aa7d1db')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    npm i webpack
    npm run electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644  "${srcdir}/${_appname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    gendesk -f --icon "${pkgname}" --categories "AudioVideo" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    #The source code does not include icons, nor does it exist upstream, so it uses the gendesk download png.
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644  "${srcdir}/${_appname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}