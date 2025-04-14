# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=git-good-bin
pkgver=0.1.5
_subver=r10.g9793e78
_electronversion=31
pkgrel=1
pkgdesc="Just a simple git client using electron and nodegit, focus on lightweight and performance.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/weedz/git-good"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}.${_subver}-1-${CARCH}.pkg.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('05a949de4000fa1587eae388ecb85834cd2f4394e1188ea01b9b7da6f598afd0'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}