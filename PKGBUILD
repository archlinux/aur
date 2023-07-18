# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=1.23.0
pkgrel=2
pkgdesc="A Northstar installer, updater, and mod-manager (binary release)"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('webkit2gtk' 'webkit2gtk-4.1' 'libappindicator-gtk3')
makedepends=('fuse2')
provides=($_pkgname)
conflicts=($_pkgname)
_appimage=flight-core_${pkgver}_amd64.AppImage
_desktop=flightcore.desktop
_url2=https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/v$pkgver
source=("$url/releases/download/v$pkgver/flight-core_${pkgver}_amd64.AppImage"
        "$_url2/LICENSE"
        "$_url2/README.md"
        "$_url2/docs/DEVELOPMENT.md"
        "$_url2/docs/FAQ.md")
sha256sums=('1146456d1ac57ae6a1c7db5861d1acb8a9f201f5e9c887cf21cccf818021199f'
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
