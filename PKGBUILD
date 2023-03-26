# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=flightcore
pkgname=flightcore
pkgver=1.10.2
pkgrel=1
pkgdesc="A Northstar installer, updater, and mod-manager"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg')
makedepends=('npm' 'rust')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('482382a023660cc5d642ed0f95b0277a89f843f94b1207813a633dc6e6b63779')

prepare() {
  # Create a shortcut
  echo "Type=Application" >> flightcore.desktop
  sed -i '1 i\Terminal=false' flightcore.desktop
  sed -i '1 i\Name=FlightCore' flightcore.desktop
  sed -i '1 i\Icon=flightcore' flightcore.desktop
  sed -i '1 i\Exec=flightcore' flightcore.desktop
  sed -i '1 i\Categories=Development;' flightcore.desktop
  sed -i '1 i\[Desktop Entry]' flightcore.desktop
  mv flightcore.desktop FlightCore-$pkgver

  # Only build the excutable
  cd FlightCore-$pkgver/src-tauri
  sed -i '18s/.*/      "active": false,/' tauri.conf.json
  # Disable the updater
  sed -i '54s/.*/      "active": false,/' tauri.conf.json

  # Install npm dependencies
  cd ..
  npm install
  cd src-vue
  npm install
}

build() {
  cd FlightCore-$pkgver/src-tauri
  npm run tauri build
}

package() {
  cd FlightCore-$pkgver
  install -Dm644 docs/assets/Square310x310Logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 flightcore.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 docs/FAQ.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 src-tauri/target/release/flight-core "$pkgdir/usr/bin/$_pkgname"
}
