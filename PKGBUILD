# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jlivertool-bin
pkgver=3.0.6
pkgrel=1
pkgdesc="Bilibili 弹幕机.(Prebuilt version)"
arch=('x86_64')
url="http://jlivertool.xinrea.cn/"
_ghurl="https://github.com/Xinrea/JLiverTool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'xdotool'
    'gdk-pixbuf2'
    'gtk3'
    'openssl'
    'libxkbcommon-x11'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Xinrea/JLiverTool/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('52fd94d2dbde94b0a32374f4a1f360d0adf23a96b2885149dc09b71a2d3b03f9'
            '5d86e387ac33cf32eee9c968d38483a30567690b843c3768b35fe4bc55b455a8'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=AudioVideo;/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/libxdo.so.4" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libxdo.so.3"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps//${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
