# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=todometer-bin
pkgver=2.0.1
_electronversion=7
pkgrel=7
pkgdesc="A simple, meter-based to-do list built with Electron and React."
arch=('x86_64')
url="https://cassidoo.github.io/todometer/"
_ghurl="https://github.com/cassidoo/todometer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}.for.linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/cassidoo/todometer/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.svg::https://raw.githubusercontent.com/cassidoo/todometer/v${pkgver}/assets/logo.svg"
    "${pkgname%-bin}.sh"
)
sha256sums=('87fa096049457bc9a63fb33c8040c15a668c81c8aab92be4efadc4a05dd50b20'
            '493e4a9d6f7124993ebc7ceaaa071da339b57ff8a76fa836f54b0977316c31d8'
            'a89aea8ce4dce004a824cba2d6d93f40a31fa876b4c0e8796cefa0bf6ff8a24c'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}