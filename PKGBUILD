# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lynmusic-bin
_pkgname=LynMusic
pkgver=1.1.5
pkgrel=1
pkgdesc="A cross-platform local music player,built with Kotlin Multiplatform."
arch=('x86_64')
url="https://github.com/wesley666/LynMusic"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'vlc'
    'libxtst'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('1a742609bbc347d957c81a92d3d6f8fd5ad872778e06b04f00a2fb0f1f6e39ee'
            '2c64a84f19252c8210eb87aac43ce8441ddaca754b8c788f74d898d244032173')
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
