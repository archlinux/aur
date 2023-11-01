# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sleek-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron25'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ransome1/sleek/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('cb7dc7be5328b9e1e6976d1debaac6ed022c4bd86312fdbd1f41135495d227ab'
            '3ad193e099728945a4483894e75ce62b0867ce735822f8800afd8d71bf32dad6'
            '56720d2369390ede931426873d0b757712d469d0b7393b155b48388f15be14ef')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" \
        -e "s|ProjectManagement|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 24x24 32x32 48x48 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}