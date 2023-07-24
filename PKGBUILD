# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A Northstar installer, updater, and mod-manager (binary release)"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('webkit2gtk' 'webkit2gtk-4.1' 'libappindicator-gtk3')
makedepends=('fuse2')
provides=($_pkgname)
conflicts=($_pkgname)
_appimage=flight-core_${pkgver}_amd64.AppImage
source=("$url/releases/download/v$pkgver/flight-core_${pkgver}_amd64.AppImage")
sha256sums=('9f55414c886236d068e3ca37288db579278cdda4429467a4e8637b9b53ac6c3a')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" > desktop
  sed -i '1 i\Comment=Installer/Updater/Launcher for Northstar' desktop
  sed -i '1 i\StartupWMClass=FlightCore' desktop
  sed -i '1 i\Icon=flightcore' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=flightcore %U' desktop
  sed -i '1 i\Name=FlightCore' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $_pkgname.desktop
  # Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
}

package() {
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 squashfs-root/usr/share/icons/hicolor/$i/apps/flight-core.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname.png"
  done
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 squashfs-root/usr/bin/flight-core "$pkgdir/usr/bin/$_pkgname"
}
