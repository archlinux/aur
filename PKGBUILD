# Maintainer : zhcn4087 <zhcn4087 @ zh-cn-4087@outlook.com>
pkgname=yolx
pkgver=0.3.9+1
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
sha512sums=('18a8c75bd2ca098daa5c07d39d621990c1476c284c9c628ed978526fdac4876fdc5077bf48386e444accaa07032926291d7897f571321b29b4d6a69584d7616c')

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
