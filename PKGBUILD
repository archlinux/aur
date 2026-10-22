# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quba-bin
_pkgname=Quba
pkgver=2.0.0
pkgrel=1
pkgdesc="A cross platform open source application to display structured (i.e., XML) and hybrid (Factur-X/ZUGFeRD PDF) electronic invoices."
arch=('x86_64')
url="https://github.com/ZUGFeRD/quba-viewer"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'nss'
    'nspr'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('37827826dad433ce02c46dddc852671b1dbd7cc1b6e4278ac6030cf7c5a08eaa'
            'f003b130010311751a619cae8188af15f003369d71c59f7b34bbc26c98e615d5')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/bin\/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Categories=OpenIndex-ZUGFeRD/Categories=Utility;/g
        s/Exec=\/opt\/OpenIndex-${_pkgname}\/${pkgname%-bin}\/bin\/${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=\/opt\/OpenIndex-${_pkgname}\/${pkgname%-bin}\/lib\/${_pkgname}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/OpenIndex-${_pkgname}/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/OpenIndex-${_pkgname}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/OpenIndex-${_pkgname}/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/OpenIndex-${_pkgname}/${pkgname%-bin}/lib/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
}
