# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mpc-qt-bin
_pkgname="io.github.mpc_qt.${pkgname%-bin}"
pkgver=25.07
pkgrel=1
pkgdesc="A clone of Media Player Classic reimplemented in Qt.(Prebuilt version)"
arch=('x86_64')
url="https://mpc-qt.github.io/"
_ghurl="https://github.com/mpc-qt/mpc-qt"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'mpv'
    'libice'
    'libsm'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('41cb6398929f0b8d4285f2ca9122d5397d9ef5475319b8889209ffd77ae2b7e8'
            '726bd004a183f9f413c0e00e51ecce455a8644447dc1a2eebfec0656597eaec8')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}