# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=local-llama-bin
_pkgname='Local Llama'
pkgver=1.0.2
_electronversion=31
pkgrel=2
pkgdesc="Local Llama also known as L³ is designed to be easy to use, with a user-friendly interface and advanced settings.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://folio.tib0.com/"
_ghurl="https://github.com/tib0/local-llama"
license=('CC-BY-NC-ND-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'vulkan-icd-loader'
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/Linux.${pkgname%-bin}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('82314c7b807af2440a8653795e0844737a9d5bd59e67774db69dfdc85c1b0383'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}