# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=flightcore
pkgver=2.19.0
pkgrel=5
pkgdesc="A Northstar installer, updater, and mod-manager"
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
arch=('x86_64')
depends=('webkit2gtk')
makedepends=('cargo' 'git' 'npm')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Categories=Development;\n\
Exec=$pkgname\n\
Icon=$pkgname\n\
Name=FlightCore\n\
Terminal=false\n\
Type=Application" > $pkgname.desktop

# Only build the executable
  cd FlightCore/src-tauri
  sed -i '/"bundle": {/,/},/{/"active":/s/true/false/}' tauri.conf.json
# Disable the updater
  sed -i '/"updater": {/,/},/{/"active":/s/true/false/}' tauri.conf.json
  cd ..

# Prioritize IPv4 because some machines have a problem with IPv6
  export NODE_OPTIONS=--dns-result-order=ipv4first

# Install npm dependencies
  export CARGO_HOME="$srcdir/CARGO_HOME"
  npm install
  cd src-vue
  npm install
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cd FlightCore
  npm run tauri build
}

package() {
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  cd FlightCore
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cd src-tauri
  install -Dm644 icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm755 target/release/flight-core "$pkgdir/usr/bin/$pkgname"
}
