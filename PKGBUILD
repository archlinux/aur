# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=2.10.0
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
        "$url/raw/main/LICENSE")
sha256sums=('4e03f3b40dfb55bc3d31777e6b9b6798a91e3de272357ec43bda55ece15453be'
            'SKIP')

prepare() {
  # Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
  # Edit the shortcut
  cd squashfs-root/usr/share/applications
  mv flight-core.desktop $_pkgname.desktop
  sed -i -E "s|Exec=flight-core|Exec=$_pkgname|g" $_pkgname.desktop
  sed -i -E "s|Icon=flight-core|Icon=$_pkgname|g" $_pkgname.desktop
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  cd squashfs-root/usr
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 share/icons/hicolor/$i/apps/flight-core.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname.png"
  done
  install -Dm644 share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 bin/flight-core "$pkgdir/usr/bin/$_pkgname"
}
