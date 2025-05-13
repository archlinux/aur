# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=akuse-bin
pkgver=1.10.1
_electronversion=26
pkgrel=2
pkgdesc="Simple and easy to use anime streaming desktop app without ads.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/akuse-app/akuse"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/linux-${pkgname%-bin}-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('cf7617d4161339545bc2082b392795f4e4d3cf31f3deda835baac1ae4051368e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}-beta/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}-beta/${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-beta/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-beta.desktop"
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist/main" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-beta.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}-beta.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}