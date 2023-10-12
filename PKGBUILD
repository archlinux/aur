# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=houdunren-camera
pkgver=1.0.67
pkgrel=2
pkgdesc="Desktop camera software that can be used for online live streaming, distance learning, and video conferencing.桌面摄像头软件，可用于在线直播、远程教学、视频会议"
arch=('any')
url="https://www.houdunren.com/"
_githuburl="https://github.com/houdunwang/camera"
license=('MIT')
depends=('bash' 'electron25')
mkdenpends=('nodejs>=20' 'pnpm' 'gendesk')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('f1963ea6598e27308ef082e715b9449bf688c66b837499e51de3560303fc7097'
            'bd3d8dc8271f8609a2462a3aa15f2d058a5df14673f09eeaab89e968001afa4d')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/camera-${pkgver}"
    sed -e '/- snap/d' -e '/- deb/d' -i electron-builder.yml
    pnpm install
    pnpm build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/camera-${pkgver}/dist/linux-unpacked/resources/app.asar" \
        -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/camera-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked/resources/"* \
        -t "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/camera-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/camera-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}