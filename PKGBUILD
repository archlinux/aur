# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.16.14
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker"
arch=('x86_64')
url="https://lvce-editor.github.io/lvce-editor"
_githuburl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
provides=("${pkgname%-bin}")
depends=('electron')
optdepends=('bash')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/lvce-editor/lvce-editor/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('76801ab7ad42ec3fd012a020df3261b1d9a188242b4af1a5b18aea81a4eb636d'
            '7736b1dbda2b18af09232f9eb619e4d3d79d855058cc7494853f25d1553ed00b'
            '430a6ffca93f056ee621dbea385ea21797d08046e753a6b033a04e320387cef5')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
}