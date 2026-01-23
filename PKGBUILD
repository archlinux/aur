# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: zebra2711 <zebra2711t@gmail.com>
_pkgname=filecxx
pkgname=filecentipede-bin
_zhsname='文件蜈蚣'
pkgver=2.82
pkgrel=12
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
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}.0/${_pkgname}_${pkgver}_linux_x64.zip"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/filecxx/FileCentipede/v${pkgver}.0/README.md"
    "${pkgname%-bin}.sh"
    fileu_linux.conf
    filecentipede.service
    "${pkgname%-bin}.install"
)
sha256sums=('41932ebba913ed1de840ac32653d69fac67e44cf366b0fe7c58a4b50c1d9804d'
            '3d681f308f0c2eee560aa31e2687b5285ecd78c79eef5b3aa5f0e4bf0009e6db'
            'cda3faf2dd8f15d42d6006620bfc108fb15323b5b80d45ec6eb6bc1ebc4729ef'
            'd874c3921adda7ffdc222fe549775ff96c63906cf99d4f5b6483edbc34d56117'
            '897e71e30e21493e15cd0f3cc4d2b7a3d48aa6d1ae02fa1d23d512c051d7e68e'
            '5d08b0c437bfc9574b8daa8e0e83aade87e83049b3fb93c2550352d130a5087f')
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

    # clean unsued file
    rm -r "${srcdir}/filecentipede/browser_extensions"
    rm -r "${srcdir}/filecentipede/plugins"
    rm -r "${srcdir}/filecentipede/webui"
}

package() {
    install -Dm755 -d "${pkgdir}/opt/filecentipede"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/filecentipede"/* "${pkgdir}/opt/filecentipede"

    # Avoid to install local and popup install window every time open filecentipede
    install -Dm644 "${srcdir}/fileu_linux.conf" "${pkgdir}/opt/filecentipede/lib/fileu_linux.conf"
    install -Dm644 "${srcdir}/filecentipede.service" "${pkgdir}/usr/lib/systemd/system/filec.service"

    install -Dm644 "${srcdir}/${pkgname%-bin}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=4 sts=4 sw=4 et: