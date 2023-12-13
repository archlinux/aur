# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttfviewer-bin
_pkgname=TTFviewer
pkgver=0.2.7
pkgrel=2
pkgdesc="A small tool for developers to view and preview various ttf font/icon image formats. It is based on Qt and opencv frameworks and supports windows/linux/macos."
arch=("x86_64")
url="https://github.com/QQxiaoming/TTFviewer"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxcb'
    'fontconfig'
    'libgpg-error'
    'freetype2'
    'libx11'
    'libglvnd'
    'xdg-utils'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${_pkgname}_Linux_V${pkgver//./}_${CARCH}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('2e14c74524641516c3208dfbcc80d379ba8579f80864c13225c1289b0c8b7b00'
            '75e728e50129743b076c46a90ff66eca45b3a354a4fcbe342b0b0986f75b0bbe')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname}.png|${pkgname%-bin}|g;s|/usr/bin/${_pkgname}|${pkgname%-bin}|g;s|Commen|Comment|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}