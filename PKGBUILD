# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alpha-badger
_appname=Alpha-Badger
pkgver=0.4.1
pkgrel=3
pkgdesc="UI wrapper around FFmpeg"
arch=('x86_64')
url="https://github.com/NoamRa/alpha-badger"
license=('MIT')
conflicts=("${pkgname}")
depends=('ffmpeg' 'bash' 'electron19')
makedepends=('gendesk' 'npm' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('a77a67190313ae9126fa6a8ad677f54b44abf21759dfb289de2be3d3599b354e'
            '2fcf48b53a250c3b84303735d73ba9998126b5a5f0c36a677acd811840850f61')
prepare() {
    gendesk -f -n -q --categories "AudioVideo" --name "${_appname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package
    asar p "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/brand/${_appname//-/_}_logo_1920x960.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}