# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=words-picker-bin
pkgver=53.8.1
pkgrel=10
pkgdesc="Hope to become a good word retrieval application.(Prebuilt version)希望成为一款好的取词应用"
arch=('x86_64')
url="https://github.com/ziqiangxu/words-picker"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxext'
    'libxtst'
    'libx11'
    'qt5-base'
    'qt5-x11extras'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-deepin-20.6.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ziqiangxu/words-picker/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('be666577f86f12afde1ec40a4283ca6e0b5d724e813faa9769261f9b05870596'
            '15c866670d9927e3c1dfe818f42be61b5e479ce7d63edb75471bf4a464be17e0'
            'd51d809af628cc8292bd430a4847adb4adefa9d4b0aee00a55a84ff9630e167c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/.png//g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}