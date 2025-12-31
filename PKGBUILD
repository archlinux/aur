# Maintainer: queinu (ZzEdovec) <zzedovec@yahoo.com>
pkgname=tankionline
pkgver=1
pkgrel=1
pkgdesc="A free-to-play multiplayer online browser-based game in the arcade tank simulator genre"
arch=('x86_64')
url="https://tankionline.com"
license=('custom')
provides=('tankionline')
makedepends=('zlib' 'fuse2' 'rsync')
install="tankionline.install"

source=("tankionline-${pkgver}-x86_64.AppImage::https://tankionline.com/desktop/TankiOnlineSetup-linux-x86_64.AppImage"
        "tankionline")
sha256sums=('17986e51b7aa85b1a1ffd391ee2492f35b98d20c8f76d6137d7098a8f5bb0717'
            '95d37050e149a15a04122680106ed671945feba0a701963ac6eef52db66d8713')

prepare() {
    chmod +x "${srcdir}/tankionline-${pkgver}-x86_64.AppImage"
    "${srcdir}/tankionline-${pkgver}-x86_64.AppImage" --appimage-extract
}

package() {
    install -d "${pkgdir}/opt/tankionline"

    install -Dm644 "${srcdir}/squashfs-root/tankionline.desktop" "${pkgdir}/usr/share/applications/tankionline.desktop"
    sed "s|Exec=AppRun|Exec=tankionline|" "${srcdir}/squashfs-root/tankionline.desktop" > "${pkgdir}/usr/share/applications/tankionline.desktop"

    install -Dm755 "${srcdir}/tankionline" "${pkgdir}/usr/bin/tankionline"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    
    rsync -a --exclude 'usr' --exclude 'AppRun' "${srcdir}/squashfs-root/" "${pkgdir}/opt/tankionline/"
    cp -r "${srcdir}/squashfs-root/usr/share" "${pkgdir}/usr"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    find "${pkgdir}/opt/tankionline" -type d -exec chmod 755 {} +
}
