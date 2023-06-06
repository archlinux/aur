# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="apk-installer-bin"
pkgver=1.6.0
pkgrel=1
pkgdesc="一款可运行于windows、macos的Apk安装器软件，快速安装Apk至手机。"
arch=('x86_64')
url="https://github.com/zhujiaming/apk-installer"
license=('ISC')
depends=()
mkdenpends=('npm' 'gendesk' 'electron')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f58d1e672a98961307577251a5952521f723607d4920138e1d325bf14297c52c')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    npm install
    electron-builder --config build.config.js --linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}-all/packages/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-all/resource/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}