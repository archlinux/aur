# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brisk-bin
_pkgname=Brisk
pkgver=2.4.0
pkgrel=1
pkgdesc="Ultra-fast, modern download manager for desktop."
arch=('x86_64')
url="https://github.com/AminBhst/brisk"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libkeybinder3'
    'libayatana-indicator'
    'ayatana-ido'
    'libayatana-appindicator'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.tar.xz")
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${CARCH}.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('521b233e1772d8cc55c58fb90f76b95e507d420e00677180665bac30f1e4b0a9'
            'd7002fa1a9ae60749490e982fa8a4f4622f7381b02559f5b014df033c0773a3c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.xz" -C "${srcdir}/usr/lib/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/data/flutter_assets/assets/icons/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
