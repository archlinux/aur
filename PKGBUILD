# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shadps4-bin
_pkgname=shadPS4
pkgver=0.14.0
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator.(Prebuilt version)"
arch=('x86_64')
url="https://shadps4.net/"
_ghurl="https://github.com/shadps4-emu/shadPS4"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'util-linux-libs'
    'zlib-ng-compat'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v.${pkgver}/${pkgname%-bin}-linux-sdl-${pkgver}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('eb6d0be1562b611b121381075eeba2c41692c11a18e14edd2fd7b20811eb5aa2'
            'c2668b966dc1f5fef271c64e1749cf136e26b42dd9f993f063c69900a191e323')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/Shadps4-sql.AppImage" ];then
        chmod +x "${srcdir}/Shadps4-sdl.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/Shadps4-sdl.AppImage" --appimage-extract > /dev/null
    sed -i "s/net.${pkgname%-bin}.${_pkgname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/applications/net.${pkgname%-bin}.${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,optional} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/net.${pkgname%-bin}.${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/net.${pkgname%-bin}.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
