# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlitestudio-bin
_pkgname=SQLiteStudio
pkgver=3.4.4
pkgrel=1
pkgdesc="A free, open source, multi-platform SQLite database manager."
arch=('x86_64')
url="https://sqlitestudio.pl/"
_ghurl="https://github.com/pawelsalawa/sqlitestudio"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'gtk3'
    'openssl-1.1'
)
makedepends=(
    'gendesk'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('d4677fad724673b1310c74c91b4ee16123be10a1c7071616d844ad8f410d2f69'
            'ec4ab4e94b781fb80ed8d7339698efa904cbba04df86de5c8e997fafcc85e9b6')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}cli" "${pkgdir}/usr/bin/${pkgname%-bin}cli"
    install -Dm644 "${srcdir}/${_pkgname}/assets/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}