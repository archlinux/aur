# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=drakontech-bin
_pkgname=DrakonTech
pkgver=2025.08.15
_electronversion=32
pkgrel=1
pkgdesc="A Visual IDE for JavaScript Development.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/stepan-mitkin/drakon.tech.desktop"
license=('Unlicense')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('39c7622581211c2ebf370668d1df4d883fbbbd53bf334f74eabbba7bbf7c34ad'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -e "
        s/\/usr\/bin\/${pkgname%-bin}/${pkgname%-bin}/g
        s/\/usr\/share\/${pkgname%-bin}\/resources\/app\/drakosha.png/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/resources/app/drakosha.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}