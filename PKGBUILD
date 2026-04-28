# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lynmusic-bin
_pkgname=LynMusic
pkgver=1.0.4
pkgrel=1
pkgdesc="A cross-platform local music player,built with Kotlin Multiplatform. (Prebuilt version)"
arch=('x86_64')
url="https://github.com/wesley666/LynMusic"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'vlc'
    'libxtst'
    'java-runtime'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('ea610fb46563f39d57adfa94ef86ea8f297a1dbd710a611b8c28419718f063c9'
            '81266c37f90d6eef62471250c3c906d0dec1f1c3041f22b7b45f7a3be612f9c1')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/Exec=${_pkgname}/g
        s/Icon=\/opt\/${pkgname%-bin}\/lib\/${_pkgname}.png/Icon=${_pkgname}/g
        s/Categories=Unknown/Categories=AudioVideo;Player/g
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/opt/". "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}