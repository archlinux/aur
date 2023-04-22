# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="houdunren-camera-appimage"
pkgver=1.0.19
pkgrel=3
pkgdesc="Desktop camera software that can be used for online live streaming, distance learning, and video conferencing.桌面摄像头软件，可用于在线直播、远程教学、视频会议"
arch=('x86_64')
url="https://www.houdunren.com/"
_githuburl="https://github.com/houdunwang/camera"
license=('MIT')
depends=('zlib' 'glibc')
mkdenpends=('nodejs >=16.4' 'npm' 'pnpm')
options=(!strip)
provides=(houdunwang)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('190ea644e67764636096f9003c040c564bae75876d39f18ba582b0eb1119d760')
build() {
    cd "${srcdir}/camera-${pkgver}"
    pnpm i
    # Just Build AppImage File
    sed 's/- snap/#- snap/g;s/- deb/#- deb/g' -i electron-builder.yml
    # For Chinese Only
    #pnpm config set ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/
    #pnpm config set ELECTRON_BUILDER_BINARIES_MIRROR=http://npm.taobao.org/mirrors/electron-builder-binaries/
    pnpm build:linux
}
package() {
    cd "${srcdir}/camera-${pkgver}/dist"
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/houdunren-camera.AppImage|g' -i "${srcdir}/camera-${pkgver}/dist/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm755 "${srcdir}/camera-${pkgver}/dist/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/camera-${pkgver}/dist/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/camera-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/camera-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}