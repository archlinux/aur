# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=filecxx
pkgname=filecentipede-bin
pkgver=2.82
pkgrel=8
pkgdesc="Cross-platform internet upload/download manager for HTTP(S), FTP(S), SSH, magnet-link, BitTorrent, m3u8, ed2k, and online videos. WebDAV client, FTP client, SSH client."
arch=("x86_64")
url="http://www.filecxx.com/"
_ghurl="https://github.com/filecxx/FileCentipede"
license=('LicenseRef-custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-bin}")
depends=(
    'libjpeg-turbo'
    'expat'
    'libbsd'
    'libxfixes'
    'libxcb'
    'libxau'
    'xcb-util-image'
    'libx11'
    'graphite'
    'libxshmfence'
    'xcb-util-renderutil'
    'libdrm'
    'libice'
    'brotli'
    'pcre'
    'libxext'
    'util-linux-libs'
    'libglvnd'
    'qt5-svg'
    'mesa'
    'xcb-util-wm'
    'qt5-base'
    'libxdmcp'
    'libxxf86vm'
    'pcre2'
    'xcb-util'
    'libxkbcommon-x11'
    'libxkbcommon'
    'libmd'
    'libpng'
    'zstd'
    'harfbuzz'
    'libsm'
    'freetype2'
    'xcb-util-keysyms'
    'fontconfig'
    'kconfig5'
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
            '10a6f2e1917d6cf95fde2654f4d59c79600bdbed7bd3b2dcf5bfb28c7c3fc1ca')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|fileu|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "Network" --name "FileCentipede文件蜈蚣" --exec "${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    find "${srcdir}/opt/${pkgname%-bin}" -type f -perm 600 -exec chmod 644 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}