# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlitestudio-bin
_pkgname=SQLiteStudio
pkgver=3.4.5
pkgrel=1
pkgdesc="A free, open source, multi-platform SQLite database manager.(Prebuilt version)"
arch=('x86_64')
url="https://sqlitestudio.pl/"
_ghurl="https://github.com/pawelsalawa/sqlitestudio"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'gtk3'
)
makedepends=(
    'gendesk'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('8a3a0fe9acac6c2911eaa17282b61f8960dcf6a67ff3cc05a93183d7f9115c5f'
            '20628dc9251146409d2631a161d7e7e24d40e5c2555a5d170914c44420b40aea')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}cli" "${pkgdir}/usr/bin/${pkgname%-bin}cli"
    install -Dm644 "${srcdir}/${_pkgname}/assets/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_pkgname}/assets/appicon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
