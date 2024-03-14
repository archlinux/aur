# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xresconv-gui-bin
pkgver=2.4.1
_electronversion=25
pkgrel=6
pkgdesc="批量转表工具的GUI版本，依赖electron"
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
    "electron${_electronversion}-bin"
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
            '7e00e3bdc3fa297143a39b09ad56a7be6b60ca29591156dc4eaf55e8c76f8e07'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('6faa1b3ffdd26df957ff6b88a44031dff85a41609918c753e5f7461673490643')
sha256sums_armv7h=('764344ac701ef894e19c1598b15c83a7b54c799022b2a6fd4f45526bce54586d')
sha256sums_x86_64=('cab293d47e071684823f8567246cf8423439ca7908c35b95e4611961aa0062eb')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}