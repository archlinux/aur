# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=flightcore-bin
pkgver=2.18.1
pkgrel=1
pkgdesc="A Northstar installer, updater, and mod-manager (binary release)"
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
arch=('x86_64')
depends=('webkit2gtk' 'libappindicator-gtk3')
makedepends=('fuse2')
provides=("flightcore")
conflicts=("flightcore")
_appimage=flight-core_${pkgver}_amd64.AppImage
source=("$url/releases/download/v$pkgver/$_appimage"
        "$url/raw/main/LICENSE")
sha256sums=('a0b35da66a1f34c1f32da84c79f396eb4341762d18f428103b21f0e7fa6f29c7'
            'SKIP')

prepare() {
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
# Edit the shortcut
  mv squashfs-root/usr/share/applications/flight-core.desktop flightcore.desktop
  sed -i "s/flight-core/flightcore/g" flightcore.desktop
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/flightcore"
  install -Dm644 flightcore.desktop -t "$pkgdir/usr/share/applications"
  cd squashfs-root/usr
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 share/icons/hicolor/$i/apps/flight-core.png "$pkgdir/usr/share/icons/hicolor/$i/apps/flightcore.png"
  done
  install -Dm755 bin/flight-core "$pkgdir/usr/bin/flightcore"
}
