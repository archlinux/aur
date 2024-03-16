# Maintainer: Joel Grunbaum <joelgrun@gmail.com>
# Contributor: Julius Dehner <julius.dehner@protonmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=plexamp-appimage
pkgver=4.10.0
pkgrel=1
pkgdesc="Modern music client for Plex"
provides=('plexamp')
conflicts=('plexamp')
arch=('x86_64')
makedepends=('imagemagick')
depends=('fuse2')
url="https://plexamp.com"
options=(!strip)
_desktop_name=plexamp.desktop
_filename=Plexamp-${pkgver}.AppImage
source=(
  https://plexamp.plex.tv/plexamp.plex.tv/desktop/${_filename}
)
sha512sums=('c5fb833bbf10be1617a4b9591f1eceec674ff216078090b29e20fcaf118000fa130da08bfb782188dcb00fafe5fe5b3a059bc5cc7f64a693b790ee3c38b2c5c3')


prepare() {
  cd "$srcdir"
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/Plexamp.AppImage --disable-seccomp-filter-sandbox|" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 $_filename "$pkgdir"/usr/bin/Plexamp.AppImage
  echo "Installing desktop launch file to $pkgdir/usr/bin/Plexamp.AppImage"
  install -Dm755 squashfs-root/${_desktop_name} "$pkgdir"/usr/share/applications/${_desktop_name}
  echo "Installing icons"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/plexamp.svg $pkgdir/usr/share/icons/hicolor/scalable/plexamp.svg
  for res in "16x16" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512"; do
    mkdir -p squashfs-root/usr/share/icons/hicolor/$res/apps/
    convert squashfs-root/usr/share/icons/hicolor/scalable/plexamp.svg -size $res squashfs-root/usr/share/icons/hicolor/$res/apps/plexamp.png
    install -Dm644 squashfs-root/usr/share/icons/hicolor/$res/apps/plexamp.png $pkgdir/usr/share/icons/hicolor/$res/apps/plexamp.png
  done
}
