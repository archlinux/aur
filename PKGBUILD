# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="houdunren-camera"
pkgver=1.0.49
pkgrel=1
pkgdesc="Desktop camera software that can be used for online live streaming, distance learning, and video conferencing.桌面摄像头软件，可用于在线直播、远程教学、视频会议"
arch=('any')
url="https://www.houdunren.com/"
_githuburl="https://github.com/houdunwang/camera"
license=('MIT')
depends=('electron')
mkdenpends=('nodejs >=16.4' 'pnpm' 'gendesk')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('bf2843b48902be7d78f60aea7b85c55b16834f94dbc2e1f0a66c9914d58b36c9'
            '29289c31ab49bacb8be38d16297e49c6f2cbfe030e7936102f5fcf1941f1efe3')
build() {
    cd "${srcdir}/camera-${pkgver}"
    # Just Build AppImage File
    sed "s|- snap|#- snap|g;s|- deb|#- deb|g" -i electron-builder.yml
    # For Chinese Only
    #pnpm config set ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/
    #pnpm config set ELECTRON_BUILDER_BINARIES_MIRROR=http://npm.taobao.org/mirrors/electron-builder-binaries/
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