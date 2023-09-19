# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aviutl-package-manager-bin
_pkgname=apm
pkgver=3.7.1
pkgrel=1
pkgdesc="A software that assists in the installation of AviUtl itself and its plugins and scripts."
arch=('x86_64')
url="https://team-apm.github.io/apm/"
_githuburl="https://github.com/team-apm/apm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('03f3900ccb17b9c0105032df56ba6a210c28a4e0ffd580bd4a2d4a67ed85cf23'
            '86ae43875d59517bf852d4364d66cc858c4d06aad130d495c742844e3a495b7d')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar e "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/usr/lib/${_pkgname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}