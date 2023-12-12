# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reqnotes-bin
_pkgname=ReqNotes
pkgver=1.8
pkgrel=4
pkgdesc="Personal Notes Application, Cross platform desktop application, developed with .NET 6 and Avalonia UI"
arch=('x86_64')
url="https://github.com/ReqBaa/ReqNotes"
_downurl="https://raw.githubusercontent.com/ReqBaa/repo"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=(
    'fontconfig'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/main/pool/main/r/${pkgname%-bin}/${pkgname%-bin}_${pkgver}-0ubuntu1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('08c7edd178beb43194eca99bf06ce9a788949b70e917458e9832272ac0db209c'
            'cd87dcfa438cbda7cee315933d5c260629bbe09ac6201b8bf37993c8ab1610cc')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -e "s|/usr/share/reqbaa/${pkgname%-bin}/${_pkgname}|${pkgname%-bin}|g" \
        -e "s|Categories=Note|Categories=Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/reqbaa/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/"* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}