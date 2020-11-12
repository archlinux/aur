# Maintainer: Joel Grunbaum <joel@joelg.net>
# Contributor: Julius Dehner <julius.dehner@protonmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=plexamp-appimage
pkgver=3.3.1
pkgrel=0
pkgdesc="Modern music client for Plex"
provides=('plexamp')
conflicts=('plexamp')
arch=('x86_64')
url="https://plexamp.plex.tv"
options=(!strip)
_desktop_name=plexamp.desktop
_filename=Plexamp-${pkgver}.AppImage
source=(
  ${url}/plexamp.plex.tv/desktop/Plexamp-${pkgver}.AppImage
)
sha512sums=('06fab633cd08f184439327fa856eb4866a579203ea9ae9595280ac01d531a67d73f15a1edcc717b2a54a48c84462cab7c53f11de3405322b77a53d99b1f0ffd4')


prepare() {
  cd "$srcdir"
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/Plexamp.AppImage|" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 $_filename "$pkgdir"/usr/bin/Plexamp.AppImage
  echo "Installing desktop launch file to $pkgdir/usr/bin/Plexamp.AppImage"
  install -Dm755 squashfs-root/${_desktop_name} "$pkgdir"/usr/share/applications/${_desktop_name}
}
