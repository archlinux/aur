# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=handbook-bin
_pkgname=Handbook
pkgver=0.20.1
_electronversion=36
pkgrel=1
pkgdesc="Create small, movable, and easily concealable windows for quick use.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/ECRomaneli/Handbook"
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x64-Setup.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ECRomaneli/Handbook/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('d03723f912b3bc3fe9a41a82ba8d0557b5d48be630a5f888ab63f13adc7e6e97'
            'f95781392d074cd6a4f9de8e5ea6625bee7df3678dc98be6c56358ee527a18c8'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}