# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=trep-tracker-bin
pkgver=2.4.1_beta
_electronversion=31
pkgrel=1
pkgdesc="Minimal, fast and powerful task tracker/todo list app with task tagging and quick views.Prebuilt version.Use system-wide electron."
arch=("x86_64")
url="https://ltres.github.io/trep-tracker/browser/"
_ghurl="https://github.com/ltres/trep-tracker"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/.}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('1474cc75c1cfa6227cc160ae766af74b22c4cb3bf7b01e2777e17fc53666f680'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
