# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Space Bunny Free.

pkgname=qlinux-device-manager-appimage
pkgver=1.3.0
pkgrel=1
pkgdesc='Device manager and hardware information viewer for Linux (bundled AppImage)'
arch=('x86_64')
url='https://github.com/birdie-github/QLinuxDeviceManager'
license=('GPL-3.0-only')
options=('!strip' '!debug')
depends=('fuse2')
source=("QLinuxDeviceManager-$pkgver-Linux-AppImage-x86_64.zip::https://github.com/birdie-github/QLinuxDeviceManager/releases/download/v$pkgver/QLinuxDeviceManager-$pkgver-Linux-AppImage-x86_64.zip")
sha256sums=('fce45aae388f8aa3660abed4992111206b12eba562ea911d37686219551518b6')

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