# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pixes-bin
pkgver=1.2.0
_subver=120
pkgrel=1
pkgdesc="Unofficial pixiv app.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/wgh136/pixes"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/pixes-${pkgver}-${_subver}-${CARCH}.pkg.tar.zst"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/wgh136/pixes/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('d7485495b366d41579a7b5b5a02b56605c9566bddc47eb32159496e21ce65ec6'
            '5aaabbeafa067d045963cfc2d8d0fed63c41d0e20267771b1b8501a350d3b3f5'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\/usr\/bin\/${pkgname%-bin}_pkg\/${pkgname%-bin}/${pkgname%-bin}/g
        s/\/usr\/share\/icons\/hicolor\/64x64\/apps\/${pkgname%-bin}.png/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/bin/${pkgname%-bin}_pkg/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/64x64/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
