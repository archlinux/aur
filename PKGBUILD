# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=letos-bin
_pkgname=Letos
pkgver=4.0.4
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
sha256sums_aarch64=('a517f68c5eadfdf8b0d5afbfba5febb6ccdad4504fdf18f1a36ee41400cb1e96')
sha256sums_x86_64=('368cdfd904878dd1f9ed92403b6cc8fb2c8d876b17ae62bb8c2f56064bcfd9dc')
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
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
