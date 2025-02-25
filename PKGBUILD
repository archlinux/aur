# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=masiro-bin
pkgver=eff3392
pkgrel=1
pkgdesc="A third-party Masiro client based on Flutter.(Prebuilt version)一个基于 Flutter 的第三方真白萌客户端"
arch=('x86_64')
url="https://github.com/qixiaoo/masiro"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libayatana-appindicator'
    'libayatana-indicator'
    'libdbusmenu-glib'
    'ayatana-ido'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('0381b9afd03d62e4ced27e055a3fc191510e4680bf45a8f285b8d7e3d0dd97e9'
            'f003b130010311751a619cae8188af15f003369d71c59f7b34bbc26c98e615d5')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}