# Maintainer: Julius Dehner <julius.dehner@protonmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=plexamp-appimage
pkgver=3.2.2
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
sha512sums=('71daaf274fdf8f9edb714ee96bc863e8f10335e71a6a90c6b38f4f3cdc1c60ff387f123d15758076426263fdb7662b794fc7d29c8fb3eb5334271996120b6907')


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
