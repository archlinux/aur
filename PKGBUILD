# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reqnotes-bin
_pkgname=ReqNotes
pkgver=2.0
pkgrel=3
pkgdesc="Personal Notes Application, Cross platform desktop application, developed with .NET 6 and Avalonia UI.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/ReqBaa/ReqNotes"
_downurl="https://raw.githubusercontent.com/ReqBaa/repo"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
depends=(
    'fontconfig'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/main/pool/main/r/${pkgname%-bin}/${pkgname%-bin}_${pkgver}-0ubuntu1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('068ecf059a5123269a62e4097169834bfb1d23c645cd07ff1987453e7ec063b4'
            'f96446b452c48cb8b0306c4f999ab6729927c8b3a27f2355abbb484e3e63cf6f')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/share/reqbaa\/${pkgname%-bin}\/${_pkgname}/${pkgname%-bin}/g
        s/Categories=Note/Categories=Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/reqbaa/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/"* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}