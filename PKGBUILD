# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cuttletron-bin
_pkgname=cuttleTron
pkgver=1.0.0
_electronversion=27
pkgrel=1
pkgdesc="Users can make screen snapshots, video record from various audio sources/sinks, apply sound effects to audio sources/sinks, and apply face masks to a webcam feed."
arch=('x86_64')
url="https://github.com/mantzaris/cuttleTron"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    'gstreamer'
    'v4l2loopback-dkms'
    'v4l2loopback-utils'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/mantzaris/cuttleTron/v${pkgver}/cuttlefish.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/mantzaris/cuttleTron/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('d58207ed0fd002c3eca923e3b9eb5001cc8dd2b5f333b2fa628b04208e81ae95'
            'b47d4f37b4491743a5b8a9154726795cb88929701dfd2f74a71a85daa6bd2408'
            'db9df723ac2ae7fad0535ec879110754b8076838dc6242f6704742704df3120e'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   cp -r "${srcdir}/resources/"{app.asar.unpacked,deps}  "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}