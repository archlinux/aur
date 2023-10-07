# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=publii-bin
_pkgname=Publii
pkgver=0.43.0
pkgrel=1
pkgdesc="The most intuitive Static Site CMS designed for SEO-optimized and privacy-focused websites."
arch=('x86_64')
url="https://getpublii.com"
_githuburl="https://github.com/GetPublii/Publii"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron26')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/download/${_pkgname}-${pkgver}.deb"
    "${pkgname%-bin}.sh")
sha256sums=('5995f43ae80716ea97c70abb2cb1b3106fc7fa9cfdb2206e92f8010aee7f8ac2'
            '1534e1e8ad3c904bc41d0143ebe4db22b62d45b3cce65302042362c77aadbafc')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}