# Maintainer: Joel Grunbaum <joelgrun@gmail.com>
# Contributor: Julius Dehner <julius.dehner@protonmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Co-Maintainer: Naxels <naxels at gmail dot com>

pkgname=plexamp-appimage
pkgver=4.13.0
pkgrel=2
pkgdesc="Modern music client for Plex"
provides=('plexamp')
conflicts=('plexamp')
arch=('x86_64')
makedepends=('imagemagick' 'librsvg')
depends=('fuse2')
url="https://plexamp.com"
options=(!strip)
_desktop_name=plexamp.desktop
_filename=Plexamp-${pkgver}.AppImage
source=(
  https://plexamp.plex.tv/plexamp.plex.tv/desktop/${_filename}
)
sha512sums=('dc1960977b76d611fa9600dee6edefcb723fde4f5be153350afa19836a1ab219065d20f057cabb3004cdf588ec0605b2b0d5f0766ee743fcab150ec38917dd62')


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
  install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/plexamp.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/plexamp.svg
  for res in "16x16" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512"; do
    mkdir -p squashfs-root/usr/share/icons/hicolor/$res/apps/
    magick -background none squashfs-root/usr/share/icons/hicolor/scalable/plexamp.svg -trim -resize $res squashfs-root/usr/share/icons/hicolor/$res/apps/plexamp.png
    install -Dm644 squashfs-root/usr/share/icons/hicolor/$res/apps/plexamp.png $pkgdir/usr/share/icons/hicolor/$res/apps/plexamp.png
  done
}
