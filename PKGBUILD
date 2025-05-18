# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=daisy-appimage
pkgdesc="美观易用且无广告的漫画和轻小说客户端, 同时支持MacOS, Windows, Android, iOS。类似动漫之家。"
pkgver=0.1.28
pkgrel=1
_pkgname=daisy-v${pkgver}.AppImage
arch=("x86_64")
url="https://github.com/niuhuan/daisy"
license=("MIT")
options=('!strip')
source=("https://github.com/niuhuan/daisy/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('SKIP')


prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract > /dev/null
    sed -i "s|^Exec=.*|Exec=/opt/appimages/daisy.AppImage --no-sandbox|" "squashfs-root/AppRun.desktop"
    sed -i "s|^Icon=.*|Icon=/usr/share/icons/daisy.png|" "squashfs-root/AppRun.desktop"
    find "squashfs-root/AppRun.png" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/opt/appimages/daisy.AppImage"
    install -Dm644 "squashfs-root/AppRun.desktop" "${pkgdir}/usr/share/applications/daisy.desktop"
    cp "squashfs-root/AppRun.png" "${pkgdir}/usr/share/icons/daisy.png"
}
