# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blinker-bin
pkgver=2.1.0
_electronversion=27
pkgrel=2
pkgdesc="Inspired by the 20 20 20 rule, this is a little reminder to look 20 feet away from your screen every 20 minutes. Keep your eyes healthy, reduce eye strain, prevent headaches and increase productivity."
arch=("x86_64")
url="https://github.com/mrkpatchaa/blinker"
license=("custom:CC0-1.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('a5d4587f962041b2bd7fa375213e83fcfa6a143a1b7030c2dc2b365654fbdff9'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}