# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Nemotron 3.5 Lightning 30B A3B.

pkgname=qlinux-device-manager-appimage
pkgver=2.0.0
pkgrel=1
pkgdesc='Device manager and hardware information viewer for Linux (bundled AppImage)'
arch=('x86_64')
url='https://github.com/birdie-github/QLinuxDeviceManager'
license=('GPL-3.0-only')
options=('!strip' '!debug')
depends=('fuse2')
source=("QLinuxDeviceManager-$pkgver-Linux-AppImage-x86_64.zip::https://github.com/birdie-github/QLinuxDeviceManager/releases/download/v$pkgver/QLinuxDeviceManager-$pkgver-Linux-AppImage-x86_64.zip")
sha256sums=('147dd66d78b3a4b2a61551cac1da8eaade170dc5b412d403472e7479376ae8b1')

package() {
    # makepkg unpacks the zip into $srcdir
    local appimage="$srcdir/QLinuxDeviceManager-$pkgver-Linux-x86_64.AppImage"
    install -Dm755 "$appimage" "$pkgdir/usr/bin/$pkgname"

    # Desktop entry and icon are pulled out of the AppImage itself
    local root="$srcdir/squashfs-root"
    "$appimage" --appimage-extract >/dev/null

    install -Dm644 "$root/usr/share/applications/io.github.birdie-github.QLinuxDeviceManager.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i \
        -e "s|^Exec=.*|Exec=$pkgname|" \
        -e "s|^TryExec=.*|TryExec=$pkgname|" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$root/usr/share/icons/hicolor/scalable/apps/io.github.birdie-github.QLinuxDeviceManager.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    sed -i "s|^Icon=.*|Icon=$pkgname|" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$root/usr/share/licenses/QLinuxDeviceManager/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}