# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="houdunren-camera-bin"
pkgver=1.0.32
pkgrel=1
pkgdesc="Desktop camera software that can be used for online live streaming, distance learning, and video conferencing.桌面摄像头软件，可用于在线直播、远程教学、视频会议"
arch=('any')
url="https://www.houdunren.com/"
_githuburl="https://github.com/houdunwang/camera"
license=('MIT')
depends=('hicolor-icon-theme' 'libcups' 'glibc' 'libxrandr' 'mesa' 'expat' 'cairo' 'libxfixes' 'libxext' \
    'at-spi2-core' 'libxcb' 'wayland' 'glib2' 'nss' 'libxcomposite' 'libdrm' 'dbus' 'libxkbcommon' \
    'alsa-lib' 'gcc-libs' 'libx11' 'nspr' 'libxdamage' 'gtk3' 'pango')
mkdenpends=('nodejs >=16.4' 'pnpm')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3bf6c483ca602178f4daa94666ae8be9717021e09dca461206e3fd3ac58a46e8')
build() {
    cd "${srcdir}/camera-${pkgver}"
    # Just Build deb File
    sed 's|- snap|#- snap|g;s|- AppImage|#- AppImage|g' -i electron-builder.yml
    # For Chinese Only
    #pnpm config set ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/
    #pnpm config set ELECTRON_BUILDER_BINARIES_MIRROR=http://npm.taobao.org/mirrors/electron-builder-binaries/
    pnpm install && pnpm build:linux
}
package() {
    ar x "${srcdir}/camera-${pkgver}/dist/${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf "${srcdir}/camera-${pkgver}/dist/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/512x512"
    install -Dm644 "${srcdir}/camera-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}