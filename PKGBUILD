# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=filecxx
pkgname=filecentipede-bin
_zhsname='文件蜈蚣'
pkgver=2.82
pkgrel=10
pkgdesc="Cross-platform internet upload/download manager for HTTP(S), FTP(S), SSH, magnet-link, BitTorrent, m3u8, ed2k, and online videos. WebDAV client, FTP client, SSH client.(Prebuilt version)"
arch=('x86_64')
url="http://www.filecxx.com/"
_ghurl="https://github.com/filecxx/FileCentipede"
license=('LicenseRef-custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-bin}")
depends=(
    'qt5-svg'
    'pcre'
    'libbsd'
)
makedepends=(
    'gendesk'
)
optdepends=(
    'qt6-wayland'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}.0/${_pkgname}_${pkgver}_linux_x64.zip"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/filecxx/FileCentipede/v${pkgver}.0/README.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('41932ebba913ed1de840ac32653d69fac67e44cf366b0fe7c58a4b50c1d9804d'
            '3d681f308f0c2eee560aa31e2687b5285ecd78c79eef5b3aa5f0e4bf0009e6db'
            'c4261a3811fbb274217ea821204682a9763d7edbcfd38db36787dd243072ef76')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/fileu/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="FileCentipede" \
        --exec="${pkgname%-bin} %U"
    sed -i "3i\Name[zh_CN]=${_zhsname}" "${srcdir}/${pkgname%-bin}.desktop"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}/usr/lib/${pkgname%-bin}" -type f -perm 600 -exec chmod 644 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}