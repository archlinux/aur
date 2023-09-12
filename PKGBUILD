# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inethi-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A GUI installer that can set up the iNethi Docker environment."
arch=("x86_64")
url="https://www.inethi.org.za/software/"
_githuburl="https://github.com/iNethi/inethi-network-builder"
license=("custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('9e56a8eefe66574e99d04d198da338fc0577b2714450b1a61763d87b536e39dc'
            'bdeeae049917dabb59459478d374a5c5083160d585825dcaf06db3fc51f88133')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    unlink "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/venv/bin/python3"
    unlink "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/venv/bin/python3.10"
    unlink "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/venv/bin/python"
    asar p "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}