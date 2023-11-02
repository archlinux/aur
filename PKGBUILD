# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=crossover-overlay
_pkgname2=crossoverlay
pkgname=$_pkgname-bin
pkgver=3.3.4
pkgrel=2
pkgdesc="🎯 A Crosshair Overlay for any screen (binary release, system Electron)"
arch=('x86_64' 'i686')
url="https://github.com/lacymorrow/crossover"
license=('CCPL:by-nc-sa4')
depends=('electron' 'http-parser' 'libappindicator-gtk3' 'libnotify' 'libvpx' 'libxss' 're2')
conflicts=($_pkgname)
provides=($_pkgname)
_desktop=$_pkgname2.desktop
source_x86_64=("$url/releases/download/v$pkgver/CrossOver-$pkgver-x86_64.rpm")
source_i686=("$url/releases/download/v$pkgver/CrossOver-$pkgver-i686.rpm ")
sha256sums_x86_64=('d83a2d7ec5bcdf253ab22210159e2bd353ef7ba9e03efa6e4b841b5facb2b933')
sha256sums_i686=('SKIP')

prepare() {
  # Create an exec file
  echo -e "export ELECTRON_IS_DEV=0\n\
cd /usr/lib/$_pkgname2\n\
exec electron /usr/lib/$_pkgname2/app.asar \$@" > $_pkgname2
  # Edit the shortcut
  mv usr/share/applications/crossover.desktop $_desktop
  chmod 644 $_desktop
  sed -i -E "s|Exec=/opt/CrossOver/crossover %U|Exec=$_pkgname2 %U|g" $_desktop
  sed -i -E "s|Icon=crossover|Icon=$_pkgname2|g" $_desktop
  # Remove unnecessary files
  cd opt/CrossOver/resources
  rm app-update.yml package-type
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/usr/lib/$_pkgname2"
  # Install
  install -Dm644 $_desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/icons/hicolor/0x0/apps/crossover.png "$pkgdir/usr/share/pixmaps/$_pkgname2.png"
  install -Dm755 $_pkgname2 -t "$pkgdir/usr/bin"
  mv opt/CrossOver/resources/* "$pkgdir/usr/lib/$_pkgname2"
}
