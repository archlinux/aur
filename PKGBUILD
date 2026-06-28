# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flightcore
pkgname=$_pkgname
pkgver=3.2.2
pkgrel=1
pkgdesc="Northstar installer, updater, and launcher"
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
arch=('x86_64')
depends=('bzip2' 'hicolor-icon-theme' 'webkit2gtk-4.1')
makedepends=('cargo' 'npm')
options=('!lto')
_pkgsrc="FlightCore-$pkgver"
source=("$_pkgname-$pkgver.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('723163ce55f20cb81240e5276b8f3985cac0582d86acf51f6b4bdbbe71d77762')

prepare() {
  cd "$_pkgsrc"
# Tauri config fix
  sed -i '/"scripts": {/,/}/{/"tauri":/s/: "tauri"/: "cd src-tauri \&\& tauri"/}' "package.json"

# Only build the executable
  sed -i '/"bundle": {/,/},/{/"active":/s/true/false/}' "src-tauri/tauri.conf.json"

# Disable the updater
  sed -i '/"updater": {/,/},/{/"active":/s/true/false/}' "src-tauri/tauri.conf.json"

# Prioritize IPv4 (some machines have a problem with IPv6)
  export NODE_OPTIONS=--dns-result-order=ipv4first

# npm dependencies
  export CARGO_HOME="$srcdir/cargo_home"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  cd src-vue
  npm install
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo_home"
  export npm_config_cache="$srcdir/npm_cache"
  cd "$_pkgsrc"
  npm run tauri build
}

package() {
  cd "$_pkgsrc"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  cd "src-tauri"
  install -Dm755 target/release/flightcore "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=FlightCore
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=Development;
END
}
