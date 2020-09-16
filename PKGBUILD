# Maintainer Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=2.0.17
pkgrel=1
pkgdesc="Desktop app for clickup.com"
arch=('x86_64')
url="https://clickup.com"
license=('custom')
depends=('fuse2')
_dirname="$pkgname-desktop-$pkgver-linux"
_filename="$pkgname-desktop-$pkgver-x86_64.AppImage"
_downloadname="$pkgname-desktop-$pkgver-linux.zip"
options=('!strip')
source=("https://attachments3.clickup.com/desktop/$_downloadname")

prepare() {
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /opt/$_filename|" squashfs-root/clickup-desktop.desktop
}

package() {
  install -Dm755 $_filename "$pkgdir/opt/$_filename"
  install -Dm644 squashfs-root/clickup-desktop.desktop "$pkgdir/usr/share/applications/clickup.desktop"
  install -dm755 "$pkgdir/usr/share/icons/hicolor"
  cp -av squashfs-root/usr/share/icons/hicolor/* "$pkgdir/usr/share/icons/hicolor/"
  chmod -R a+rX "$pkgdir/usr/share/icons/hicolor"
}
sha256sums=('708b6c33d787ded3fba197fffda083df7700e674c69ac1fef7c1f4f5723387bc')
