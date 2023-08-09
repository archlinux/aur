# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=houdunren-camera
pkgver=1.0.58
pkgrel=1
pkgdesc="Desktop camera software that can be used for online live streaming, distance learning, and video conferencing.桌面摄像头软件，可用于在线直播、远程教学、视频会议"
arch=('any')
url="https://www.houdunren.com/"
_githuburl="https://github.com/houdunwang/camera"
license=('MIT')
depends=('electron25')
mkdenpends=('nodejs >=16.4' 'pnpm' 'gendesk')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('0942a684342cc78e2def322188a1be05e9377350ffb5b7e9df2e8ef035b3d6d4'
            'e2b8d1da32558fea4eed0127cd12673b8b3a1dabe9225da6900f0415e0013861')
build() {
    cd "${srcdir}/camera-${pkgver}"
    # Just Build AppImage File
    sed "s|- snap|#- snap|g;s|- deb|#- deb|g" -i electron-builder.yml
    pnpm i
    pnpm build:linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/camera-${pkgver}/dist/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/camera-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/camera-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}