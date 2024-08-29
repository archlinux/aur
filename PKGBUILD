# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=game_box
pkgname="${_pkgname//_/-}-bin"
pkgver=0.1.0
pkgrel=9
pkgdesc="An Old-gen console games emulator. This project only relies on the Qt framework.一款游戏家用机模拟器,仅依赖Qt框架"
arch=('x86_64')
url="https://github.com/QQxiaoming/game_box"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'e2fsprogs'
    'libxcb'
    'libgpg-error'
    'libglvnd'
    'libx11'
    'mesa'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/V${pkgver}/${_pkgname}_ubuntu2004_V${pkgver//./}_${CARCH}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/QQxiaoming/game_box/V${pkgver}/img/icon256.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('f031db78f85ea318b17fd617823fa512990cf29879ed01a7989a88094130933e'
            '8410145a23e7c9bd51ada0ac251783079903ab8c3de44c500cf05f91b9745fac'
            '1ec36d4ede07ca07c85e1d27b5c69107444747190abebd76ba97c64fdb68b4c7')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${_pkgname//_/-}-bin" --categories="Game" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %F"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}_ubuntu2004/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}