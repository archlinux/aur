# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=letos-bin
_pkgname=Letos
pkgver=4.0.1
pkgrel=1
pkgdesc="A free, open source, multi-platform SQLite database manager.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://letos.org/"
_ghurl="https://github.com/pawelsalawa/letos"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'gtk3'
    'xcb-util-cursor'
    'tcl'
)
options=(
    '!strip'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage")
sha256sums=('20628dc9251146409d2631a161d7e7e24d40e5c2555a5d170914c44420b40aea')
sha256sums_aarch64=('990c5c5e64f4ba9123701bb1542101314a8ec3d8a64a6c201ca92f3c3d88e7bc')
sha256sums_x86_64=('4af004fc95e0c5edd5affc6bba17047efd62e41580fe0037bbc64e7e5a2a3834')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
