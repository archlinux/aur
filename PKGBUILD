# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=flightcore
pkgver=2.8.4
pkgrel=2
pkgdesc="A Northstar installer, updater, and mod-manager"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('webkit2gtk' 'libappindicator-gtk3')
makedepends=('cargo' 'git' 'npm')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  # Create a shortcut
  echo "Type=Application" > desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Name=FlightCore' desktop
  sed -i '1 i\Icon=flightcore' desktop
  sed -i '1 i\Exec=flightcore' desktop
  sed -i '1 i\Categories=Development;' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $pkgname.desktop

  # Only build the excutable
  cd FlightCore/src-tauri
  sed -i '18s/.*/      "active": false,/' tauri.conf.json
  # Disable the updater
  sed -i '54s/.*/      "active": false,/' tauri.conf.json
  cd ..

  # Prioritize IPv4 because some machines have a problem with IPv6
  export NODE_OPTIONS=--dns-result-order=ipv4first

  # Install npm dependencies
  npm install
  cd src-vue
  npm install
}

build() {
  cd FlightCore
  npm run tauri build
}

package() {
  cd FlightCore
  install -Dm644 docs/assets/Square310x310Logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md docs/DEVELOPMENT.md docs/FAQ.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 src-tauri/target/release/flight-core "$pkgdir/usr/bin/$pkgname"
}
