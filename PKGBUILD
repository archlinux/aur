# Maintainer Jonne Haß <me@jhass.eu>
pkgname=workflowy
pkgver=1.2.18
pkgrel=1
pkgdesc="Desktop app for workflowy.com, a note taking tool based on lists"
arch=('x86_64')
url="https://workflowy.com"
license=('custom')
depends=('fuse2')
_filename="$pkgname-$pkgver.AppImage"
_downloadname="WorkFlowy-x86_64.AppImage"
options=('!strip')
source=("$_filename::https://github.com/workflowy/desktop/releases/download/v$pkgver/$_downloadname")

prepare() {
  cd "$srcdir"
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env DESKTOPINTEGRATION=0 /opt/$_downloadname|" squashfs-root/workflowy.desktop
}

package() {
  cd "$srcdir/"
  install -Dm755 $_filename "$pkgdir/opt/$_downloadname"
  install -Dm644 squashfs-root/workflowy.desktop "$pkgdir/usr/share/applications/workflowy.desktop"
  install -dm755 "$pkgdir/usr/share/icons/hicolor"
  cp -av squashfs-root/usr/share/icons/hicolor/* "$pkgdir/usr/share/icons/hicolor/"
  chmod -R a+rX "$pkgdir/usr/share/icons/hicolor"
}
sha256sums=('52da4416061df222e04a637b9be0e59b94a6d42074ea1c18ba407a49b4d22fd7')
