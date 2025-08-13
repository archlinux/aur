# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=pikapika-appimage
pkgdesc="A comic browser，support Android / iOS / MacOS / Windows / Linux."
pkgver=1.8.16
pkgrel=1
arch=("x86_64")
_flutterver=2.10.3
_pkgname="pikapika-v${pkgver}-linux-${arch}-flutter_${_flutterver}.AppImage"
url="https://github.com/ComicSparks/pikapika"
license=("unknown")
options=('!strip')
conflicts=("pikapika-bin")
source=("https://github.com/ComicSparks/pikapika/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('SKIP')

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
