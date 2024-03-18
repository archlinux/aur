# Maintainer : zhcn4087 <zhcn4087 @ zh-cn-4087@outlook.com>
pkgname=yolx
pkgver=0.3.8+1
pkgrel=1
pkgdesc="A modern download tool developed with Flutter, powered by 'Aria 2' at its core. "
_pkgname=yolx
pkgname="yolx-appimage"
arch=('x86_64')
url="https://github.com/uiYzzi/Yolx"
license=('GPL')
depends=('fuse2fs')
provides=("$pkgname")
options=(!strip)
_appimage="${_pkgname}-linux-${pkgver}.AppImage"
source=("https://github.com/uiYzzi/Yolx/releases/download/${pkgver}/yolx-linux-${pkgver}.AppImage")
noextract=("$_appimage")
sha512sums=('1564666047bf0e54a4dfa7e72271b2a36b7fb8eeab71a20d5f3d29ca32296a95b28010efb1c0d847f089a3d3645866f90c0ed25b5a5801e95a6664537b111a81')

prepare() {
    chmod +x "$_appimage"
    "./$_appimage" --appimage-extract
    # Fixing the desktop file
    sed -i  "/^Exec=/c\Exec=/opt/$_pkgname/$_appimage %U " "squashfs-root/yolx.desktop"
    sed -i -E "s:Icon=yolx:Icon=com.yolx.app:" "squashfs-root/yolx.desktop"
}

package() {
    # Appimage and symlink
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/yolx.desktop" "${pkgdir}/usr/share/applications/com.yolx.app.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/pixmaps/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/yolx.png" "${pkgdir}/usr/share/pixmaps/com.yolx.app.png"
}
