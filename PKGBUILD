# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=creamplayer
_appname=Creamplayer
pkgver=4.0.2
pkgrel=1
pkgdesc="网易云播放/下载器,QQ音乐批量下载工具 Netease music and QQ music downloader and player"
arch=('any')
url="https://github.com/Beadd/Creamplayer"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'electron13')
makedepends=('npm' 'nodejs>=8' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('af1239c6a20d1f656bf79fd5df51fc81488437a3747b7988d40eb5a5aa129136'
            '7a072bd2845becf96168ebf88b4e26ac8b4f1695f3a0d7426d083acc5aa7d1db')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
#    nvm use 16
    npm ci
    npm i webpack
    npm run electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644  "${srcdir}/${_appname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    gendesk -f -n --categories "AudioVideo" --name "${_appname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644  "${srcdir}/${_appname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}