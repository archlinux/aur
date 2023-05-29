# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=flightcore
pkgver=1.16.1
pkgrel=2
pkgdesc="A Northstar installer, updater, and mod-manager"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('webkit2gtk' 'webkit2gtk-4.1' 'libappindicator-gtk3')
makedepends=('cargo' 'git' 'npm')
optdepends=('sccache: compiler caching for faster compiling')
_desktop=flightcore.desktop
source=("git+$url.git")
sha256sums=('SKIP')

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
  mv $_desktop FlightCore

  # Only build the excutable
  cd FlightCore/src-tauri
  sed -i '18s/.*/      "active": false,/' tauri.conf.json
  # Disable the updater
  sed -i '54s/.*/      "active": false,/' tauri.conf.json
  cd ..

  # Switch tag version
  git checkout tags/v${pkgver}

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
  install -Dm644 ${_desktop} "$pkgdir/usr/share/applications/$_desktop"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md docs/DEVELOPMENT.md docs/FAQ.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 src-tauri/target/release/flight-core "$pkgdir/usr/bin/$pkgname"
}
