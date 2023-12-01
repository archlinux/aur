# Maintainer: TimeTrap <zhaoyuanpan at gmail dot com>
# Contributor: Jingu <xiuluo dot android at gmail dot com>
# Contributor: Usama <eruzzamma at gmail dot com>
pkgname=cursor-appimage
_pkgname=cursor
pkgver=0.18.1
pkgrel=1
pkgdesc="Write, edit, and chat about your code with GPT-3.(AppImage)"
arch=('x86_64')
url="https://cursor.so"
license=('custom')
options=('!strip')
depends=('hicolor-icon-theme' 'zlib')
source=("${_pkgname}-${pkgver}.AppImage::https://dl.todesktop.com/230313mzl4w4u92/linux/appImage/x64")
sha256sums=('a79e676e07aae088fea308b91c9239b7acda86c35e766f2dbd5e30219bd466db')
_install_path="/opt/appimages"

prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/Cursor.AppImage/g' -i "${srcdir}/squashfs-root/cursor.desktop"
    sed 's/Exec=\/opt\/appimages\/Cursor.AppImage/Exec=\/opt\/appimages\/cursor.AppImage/g' -i "${srcdir}/squashfs-root/cursor.desktop"
    sed 's/StartupWMClass=Cursor/StartupWMClass=cursor/g' -i "${srcdir}/squashfs-root/cursor.desktop"

}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 32x32 64x64 128x128 256x256 512x512;do
        install -Dm645 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/cursor.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/cursor.png"
    done

    install -Dm755 "${srcdir}/squashfs-root/cursor.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
