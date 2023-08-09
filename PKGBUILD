# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=2.7.0
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
        "https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/v$pkgver/LICENSE")
sha256sums=('e17436bda33cbdf314f5b7de339345403ffdbca512a862377faaf310a5ae2c09'
            'SKIP')

prepare() {
  # Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
  # Edit a shortcut
  cd squashfs-root/usr/share/applications
  mv flight-core.desktop $_pkgname.desktop
  sed -i -E "s|Exec=flight-core|Exec=$_pkgname|g" $_pkgname.desktop
  sed -i -E "s|Icon=flight-core|Icon=$_pkgname|g" $_pkgname.desktop
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cd squashfs-root
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 usr/share/icons/hicolor/$i/apps/flight-core.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname.png"
  done
  install -Dm644 usr/share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 usr/bin/flight-core "$pkgdir/usr/bin/$_pkgname"
}
