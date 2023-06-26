# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="houdunren-camera-electron-bin"
pkgver=1.0.40
pkgrel=1
pkgdesc="Desktop camera software that can be used for online live streaming, distance learning, and video conferencing.桌面摄像头软件，可用于在线直播、远程教学、视频会议"
arch=('x86_64')
url="https://www.houdunren.com/"
_githuburl="https://github.com/houdunwang/camera"
license=('MIT')
depends=('electron')
mkdenpends=('nodejs >=16.4' 'pnpm' 'gendesk')
conflicts=("${pkgname%-electron-bin}" "${pkgname%-electron-bin}-appimage" "${pkgname%-electron-bin}-bin")
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-electron-bin}.sh")
sha256sums=('2d22c722e684fe6c19a9d700f8ca8d465e51559ea196f0e934ae4b9bd54563c9'
            '29289c31ab49bacb8be38d16297e49c6f2cbfe030e7936102f5fcf1941f1efe3')
build() {
    cd "${srcdir}/camera-${pkgver}"
    # Just Build AppImage File
    sed "s|- snap|#- snap|g;s|- deb|#- deb|g" -i electron-builder.yml
    # For Chinese Only
    #pnpm config set ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/
    #pnpm config set ELECTRON_BUILDER_BINARIES_MIRROR=http://npm.taobao.org/mirrors/electron-builder-binaries/
    pnpm install && pnpm build:linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-electron-bin}"
    cp -r "${srcdir}/camera-${pkgver}/dist/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname%-electron-bin}"
    install -Dm755 "${srcdir}/${pkgname%-electron-bin}.sh" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}"
    install -Dm644 "${srcdir}/camera-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-electron-bin}.png"
    install -Dm644 "${srcdir}/camera-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname%-electron-bin}" --categories "Utility" --name "${pkgname%-electron-bin}" --exec "/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}