# Maintainer: yavavz <snakesoid666 at gmail dot com>

pkgname=picacg-qt-appimage
pkgver=1.5.2
pkgrel=2
glibcrev=2.38
pkgdesc="PicACG Comic PC Client For Linux"
arch=("x86_64")
url="https://github.com/tonquer/picacg-qt"
license=('LGPL3')
_pkgname="bika_v${pkgver}_linux_glibc${glibcrev}.AppImage"
noextract=(${_pkgname})
options=("!strip")
depends=("fuse2")
# https://github.com/tonquer/picacg-qt/blob/main/src/requirements.txt
optdepends=('python-waifu2x-vulkan: Waifu2x-Vulkan support')
provides=('bika')
conflicts=('bika')
source=("${url}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('cc0a24d3c47d5ddc7acfa24118da109713eb495bf192ab9883d7e07fc38c8f5a')

_installdir=/opt/appimages
_installname=picacg

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract >/dev/null
    sed -i "s|^Exec.*|Exec=env DESKTOPINTEGRATION=no ${_installdir}/${_installname}.AppImage|" "squashfs-root/PicACG.desktop"
    sed -i "s|^Icon.*|Icon=/usr/share/icons/PicACG.png|" "squashfs-root/PicACG.desktop"
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_installname}.AppImage"
    install -Dm644 "squashfs-root/PicACG.desktop" "${pkgdir}/usr/share/applications/${_installname}.desktop"
    cp -R "squashfs-root/PicACG.png" "${pkgdir}/usr/share/icons"
}
