# Maintainer: yavavz <snakesoid666 at gmail dot com>

pkgname=picacg-qt-appimage
pkgver=1.4.4
pkgrel=1
pkgdesc="PicACG Comic PC Client For Linux"
arch=("x86_64")
url="https://github.com/tonquer/picacg-qt"
license=('LGPL3')
_pkgname="bika_v${pkgver}_linux-${arch}.AppImage"
noextract=(${_pkgname})
options=("!strip")
depends=("fuse2")
# https://github.com/tonquer/picacg-qt/blob/main/src/requirements.txt
optdepends=('python-waifu2x-vulkan: Waifu2x-Vulkan support')
provides=('bika')
conflicts=('bika')
source=("${url}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('30c9d40583a7ae73f29ab334a636040de33428d79dcf5a17ea91fe6997f1cbdd')

_installdir=/opt/appimages
_installname=picacg

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract >/dev/null
    sed -i "s+^Exec.*+Exec=env DESKTOPINTEGRATION=no ${_installdir}/${_installname}.AppImage+" "squashfs-root/PicACG.desktop"
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_installname}.AppImage"
    install -Dm644 "squashfs-root/PicACG.desktop" "${pkgdir}/usr/share/applications/${_installname}.desktop"
    cp -R "squashfs-root/PicACG.png" "${pkgdir}/usr/share/icons"
}
