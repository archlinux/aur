
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deeplink-launcher-bin
_pkgname="DeepLink Launcher"
pkgver=1.7.2
pkgrel=1
pkgdesc="A multiplatform app designed for executing and managing deeplinks. "
arch=('x86_64')
url="https://play.google.com/store/apps/details?id=dev.koga.deeplinklauncher.android"
_ghurl="https://github.com/FelipeKoga/deeplink-launcher"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    'java-runtime'
    'alsa-lib'
    'libxtst'
    'libx11'
    'libxrender'
    'libglvnd'
    'fontconfig'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_1.1.2-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('cd4a4bd309f84da3ff0c035fef319b2852789edd540e823d1d5ffe38c10be989'
            'b7cbffe78738d12856a1287503e32c0c22c484721fd87f33bdf091d003b320e5')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${_pkgname}/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\"\/opt\/${pkgname%-bin}\/bin\/${_pkgname}\"/${pkgname%-bin}/
        s/\/opt\/${pkgname%-bin}\/lib\/${_pkgname// /_}.png/${pkgname%-bin}/
        s/Unknown/Development;/
    " -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/"{bin,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}