# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=pikapika-appimage
pkgdesc="A comic browser，support Android / iOS / MacOS / Windows / Linux."
pkgver=1.8.5
pkgrel=1
arch=("x86_64")
_flutterver=2.10.3
_pkgname="pikapika-v${pkgver}_flutter-${_flutterver}-linux-${arch}.AppImage"
url="https://github.com/niuhuan/pikapika"
license=("unknown")
options=('!strip')
conflicts=("pikapika-bin")
source=("${url}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('568930faca8ce7e2fc38eb01b034d2f50ac39714326149ab3a43e97baed8578b')

_installPath=/opt/appimages/pikapika.AppImage

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract > /dev/null
    sed -i "s+^Exec=+&${_installPath} --no-sandbox+" "squashfs-root/pikapika.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installPath}"
    install -Dm644 "squashfs-root/pikapika.desktop" "${pkgdir}/usr/share/applications/pikapika.desktop"
    cp -r "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
