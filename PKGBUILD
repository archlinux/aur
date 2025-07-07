# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shadps4-bin
_pkgname=shadPS4
pkgver=0.10.0
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator.(Prebuilt version)"
arch=('x86_64')
url="https://shadps4.net/"
_ghurl="https://github.com/shadps4-emu/shadPS4"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'libice'
    'gmp'
    'libgpg-error'
    'mesa'
    'harfbuzz'
    'libsm'
    'libglvnd'
    'fribidi'
    'libdrm'
    'fontconfig'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v.${pkgver}/${pkgname%-bin}-linux-qt-${pkgver}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('c219f25d2382095deae74ec8ffd60a5b43df9d8752ae918e8e08957c5eff6016'
            'bf28379cb0ba33a297560e1e50c2ae13504487be2e8ebb39b899f48b442886f0')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/Shadps4-qt.AppImage" ];then
        chmod +x "${srcdir}/Shadps4-qt.AppImage"
    fi
    "${srcdir}/Shadps4-qt.AppImage" --appimage-extract > /dev/null
    sed -i "s/net.${pkgname%-bin}.${_pkgname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/applications/net.${pkgname%-bin}.${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,optional,plugins,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/net.${pkgname%-bin}.${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/net.${pkgname%-bin}.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
