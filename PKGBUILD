# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=habit_tracker
pkgname="${_appname//_/-}-bin"
_pkgname=HabitTracker
pkgver=0.0.5
pkgrel=8
pkgdesc="Cross platform habit tracker.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/accountability-tracker/habit_tracker"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/accountability-tracker/habit_tracker/v${pkgver}/assets/icon/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('f3410365ea1b1b96a2778df526509c983af8bea0e7502dc9d2ff146cff3f8cc4'
            '90c1ffebcd4b680811b4ded5aaedccd21b1b5d86b79144584c979815940a0f0f'
            '25f16cb3109de910b983155b7daa585e57303403320670aa90d60dd9ecb9c8d0')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_appname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}