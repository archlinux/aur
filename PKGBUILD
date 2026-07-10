# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mpc-qt-bin
_pkgname="io.github.mpc_qt.${pkgname%-bin}"
pkgver=26.07
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
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('c34e3b137f3c111b31771038e30705eb9141cb48e47dfc6828badf4e0dfa1e3a'
            'a9951945cd88e675af723b17120ebcafb4902718260aee12d378d68e53b8d5b8')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_pkgname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_pkgname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}_enqueue.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}_enqueue.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_pkgname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}