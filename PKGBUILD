# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlitestudio-bin
_pkgname=SQLiteStudio
pkgver=3.4.18
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
    'openssl-1.1'
)
makedepends=(
    'gendesk'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('132b0fe53f316a68f7b5a11b2c517300a5cc7047cf8ad3f8087d15df486d20f0'
            '20628dc9251146409d2631a161d7e7e24d40e5c2555a5d170914c44420b40aea')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    cd "${srcdir}/${_pkgname}/lib"
    unlink libsqlite3.so.0.8.6
    unlink libsqlite3.so.0
    ln -sf libsqlite3.so libsqlite3.so.0
    ln -sf libsqlite3.so.0 libsqlite3.so.0.8.6
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
