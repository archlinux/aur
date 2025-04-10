# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=flightcore
pkgver=2.26.2
pkgrel=2
pkgdesc="Installer/Updater/Launcher for Northstar"
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
arch=('x86_64')
depends=('bzip2' 'gcc-libs' 'hicolor-icon-theme' 'webkit2gtk')
makedepends=('cargo' 'npm')
options+=('!lto')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da695ebbc46bb5fbc71e0249e7668e1d0c644e6c2eff58f7726432b636319646')

prepare() {
# Shortcut
  echo -e '[Desktop Entry]
Categories=Development;
Exec=flightcore
Icon=flightcore
Name=FlightCore
Terminal=false
Type=Application' > $pkgname.desktop

# Only build the executable
  cd FlightCore-$pkgver/src-tauri
  sed -i '/"bundle": {/,/},/{/"active":/s/true/false/}' tauri.conf.json
# Disable the updater
  sed -i '/"updater": {/,/},/{/"active":/s/true/false/}' tauri.conf.json
  cd ..

# Prioritize IPv4 (some machines have a problem with IPv6)
  export NODE_OPTIONS=--dns-result-order=ipv4first

# npm dependencies
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  cd src-vue
  npm install
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export npm_config_cache="$srcdir/npm_cache"
  cd FlightCore-$pkgver
  npm run tauri build
}

package() {
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  cd FlightCore-$pkgver
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cd docs
  install -Dm644 ../README.md DEV-TOOLS.md DEVELOPMENT.md FAQ.md TROUBLESHOOTING.md\
  -t "$pkgdir/usr/share/doc/$pkgname"
  cd ../src-tauri/icons
  _icdr=usr/share/icons/hicolor
  install -Dm644 32x32.png "$pkgdir/$_icdr/32x32/apps/$pkgname.png"
  install -Dm644 128x128.png "$pkgdir/$_icdr/128x128/apps/$pkgname.png"
  install -Dm644 128x128@2x.png "$pkgdir/$_icdr/256x256/apps/$pkgname.png"
  install -Dm644 icon.png "$pkgdir/$_icdr/512x512/apps/$pkgname.png"
  install -Dm755 ../target/release/flight-core "$pkgdir/usr/bin/$pkgname"
}
