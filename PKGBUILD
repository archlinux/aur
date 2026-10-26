# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: zebra2711 <zebra2711t@gmail.com>
_pkgname=filecxx
pkgname=filecentipede-bin
_zhsname='文件蜈蚣'
pkgver=2.9
pkgrel=17
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
install="${pkgname%-bin}.install"
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x64.zip"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/filecxx/FileCentipede/${pkgver}/README.md"
    "${pkgname%-bin}.sh"
    fileu_linux.conf
    filecentipede.service
    filecentipede.openrc
)
sha256sums=('8a4d9b9e7ef9cda3e7e35dcad5eded0c05e5ae7c65c577fa9382692131fbe7b1'
            '1e74a5e385401ac768378bac0f939ed3d108ce69158aaedb3d670352ec58ae5e'
            '2ed7e24c7afde4d6588a3061dcb1266437bf2ededdb2899cd5e962e9520ce054'
            'd874c3921adda7ffdc222fe549775ff96c63906cf99d4f5b6483edbc34d56117'
            '791e8e5a033418e66fbc2e43da648636d4887fca34e580dddc5b59ad470d8605'
            '8b9bbac0341610f5a6b2a2e6ce7bc2eef1b509dfd1de8102c170aec1e609d623')
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
        --exec="${pkgname%-bin} %F"
    sed -i "3i\Name[zh_CN]=${_zhsname}" "${srcdir}/${pkgname%-bin}.desktop"
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
    find "${srcdir}/${pkgname%-bin}" -type f -perm 600 -exec chmod 644 {} +

    # Clean unused files
    rm -r "${srcdir}/filecentipede/browser_extensions"
}

package() {
    install -Dm755 -d "${pkgdir}/opt/filecentipede"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/filecentipede"/* "${pkgdir}/opt/filecentipede"

    # Avoid local installation and pop-up windows when opening FileCentipede
    install -Dm644 "${srcdir}/fileu_linux.conf" "${pkgdir}/opt/filecentipede/lib/fileu_linux.conf"
    install -Dm644 "${srcdir}/filecentipede.service" "${pkgdir}/usr/lib/systemd/system/filec.service"


    # opemrc (Artrix, Gentoo)
    install -Dvm755 "${startdir}/filecentipede.openrc" "${pkgdir}/etc/init.d/filecentipede"

    install -Dm644 "${srcdir}/${pkgname%-bin}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=4 sts=4 sw=4 et:
