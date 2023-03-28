# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

pkgname=flightcore
pkgver=1.11.1
pkgrel=1
pkgdesc="A Northstar installer, updater, and mod-manager"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg')
makedepends=('npm' 'rust')
optdepends=('sccache: compiler caching for faster compiling')
_desktop=flightcore.desktop
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1eb1c52d2378a801515ac877c73e5f37b4f795d18c2822138078376a5c7c1640')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> $_desktop
  sed -i '1 i\Comment=Installer/Updater/Launcher for Northstar' $_desktop
  sed -i '1 i\StartupWMClass=FlightCore' $_desktop
  sed -i '1 i\Icon=flightcore' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=flightcore %U' $_desktop
  sed -i '1 i\Name=FlightCore' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
  mv $_desktop FlightCore-$pkgver

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
  cd FlightCore-$pkgver
  npm run tauri build
}

package() {
  cd FlightCore-$pkgver
  install -Dm644 docs/assets/Square310x310Logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ${_desktop} "$pkgdir/usr/share/applications/$_desktop"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 docs/FAQ.md docs/DEVELOPMENT.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 src-tauri/target/release/flight-core "$pkgdir/usr/bin/$pkgname"
}
