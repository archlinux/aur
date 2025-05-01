# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geforce-infinity-bin
_pkgname=GeForceInfinity
pkgver=1.0.0
_electronversion=31
pkgrel=2
pkgdesc="A work-in-progress application designed to enhance the GeForce NOW experience.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://geforce-infinity.xyz/"
_ghurl="https://github.com/AstralVixen/GeForce-Infinity"
license=('MIT')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/AstralVixen/GeForce-Infinity/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b180b12ac6feba152d14e915cfdddaa605ae70ec1d8b299672c09724a1c88138'
            '669b46a31342a99549197ed97fac42000bbfe178114b2d6843aa08f6902b11a1'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/\/opt\/${_pkgname}\/resources\/infinitylogo\.ico/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/500x500/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}