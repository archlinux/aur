# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=1.24.0
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
source=("$url/releases/download/v$pkgver/flight-core_${pkgver}_amd64.AppImage"
        "https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/v$pkgver/README.md"
        "https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/v$pkgver/docs/DEVELOPMENT.md"
        "https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/v$pkgver/docs/FAQ.md")
sha256sums=('d191b8e5419615ae6903fd0dac6aaffdbfe26a172b8ac1a8e802eebb9be1cdd9'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
  install -Dm644 DEVELOPMENT.md FAQ.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 squashfs-root/usr/bin/flight-core "$pkgdir/usr/bin/$_pkgname"
}
