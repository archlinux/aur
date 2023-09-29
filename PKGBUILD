# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=2.10.1
pkgrel=1
pkgdesc="A Northstar installer, updater, and mod-manager (binary release)"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('webkit2gtk' 'libappindicator-gtk3')
makedepends=('fuse2')
provides=($_pkgname)
conflicts=($_pkgname)
_appimage=flight-core_${pkgver}_amd64.AppImage
source=("$url/releases/download/v$pkgver/flight-core_${pkgver}_amd64.AppImage"
        $pkgver-LICENSE::"$url/raw/v2.10.1/LICENSE")
sha256sums=('f88d3c9f936611cd7f59a32f38e5c80e97ee8bbf640c822d16a6e80fd3303d04'
            'SKIP')

prepare() {
  # Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
  # Edit the shortcut
  mv squashfs-root/usr/share/applications/flight-core.desktop $srcdir/$_pkgname.desktop
  sed -i 's/flight-core/flightcore/g' $_pkgname.desktop
}

package() {
  install -Dm644 $pkgver-LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  cd squashfs-root/usr
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 share/icons/hicolor/$i/apps/flight-core.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname.png"
  done
  install -Dm755 bin/flight-core "$pkgdir/usr/bin/$_pkgname"
}
