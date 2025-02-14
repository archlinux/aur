# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=drakontech-bin
_pkgname=DrakonTech
pkgver=2025.01.12
_electronversion=32
pkgrel=2
pkgdesc="A Visual IDE for JavaScript Development.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://drakon.tech/"
_ghurl="https://github.com/stepan-mitkin/drakon.tech.desktop"
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
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/stepan-mitkin/drakon.tech.desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9279e9c29112b3b498d537999f74a0948957770fc5dc0012214ca283a3b53a9f'
            '6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
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
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}