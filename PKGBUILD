# Maintainer: smalllqiang <F11F10E8 at outlook dot com>
# Contributor: yavavz <snakesoid666 at gmail dot com>

pkgname=picacg-qt-appimage
pkgver=1.5.8.1
pkgrel=1
_tagver=1.5.8.1
_glibcrev=2.39
pkgdesc="PicACG Comic PC Client For Linux"
arch=("x86_64")
url="https://github.com/tonquer/picacg-qt"
license=('LGPL3')
_pkgname="bika_v${pkgver}_linux-glibc${_glibcrev}.AppImage"
noextract=(${_pkgname})
options=("!strip")
depends=("fuse2")
# https://github.com/tonquer/picacg-qt/blob/main/src/requirements.txt
optdepends=('python-waifu2x-vulkan: Waifu2x-Vulkan support')
provides=('bika')
conflicts=('bika')
source=("${url}/releases/download/v${_tagver}/${_pkgname}")
sha256sums=('94abc9c3ea420cbb35e04dd4ff677915774a9679dc1086f934c1a228379f4a70')

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
