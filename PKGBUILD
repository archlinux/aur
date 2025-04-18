# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xresconv-gui-bin
pkgver=2.5.2
_electronversion=32
pkgrel=1
pkgdesc="批量转表工具的GUI版本,依赖electron.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/xresloader/xresconv-gui"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.tar.xz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-armv7l.tar.xz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.tar.xz")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/xresloader/xresconv-gui/v${pkgver}/doc/logo.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/owent/xresconv-gui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('3383900bc8b96fe4f9fcd7c851f925bc995aa3db9c054e5838c1e2703bf57898'
            '67c0ebf08bd9e9577c8c204a347d937cae064f2c80268a9abcb1afc96b1209c4'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('913c8a74aa52e24d0e2f4ea0d429fea7a3f4a5ed77b8018f3d44e3f6f148dc2f')
sha256sums_armv7h=('10a37797b48cbae48cabad952aaedf34253a83eecc48e3f9a81928b4bc003c04')
sha256sums_x86_64=('fe9219f0920b1b621e09aef3d2fd29ee1711791bbc911fb320b6fc590385f716')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}