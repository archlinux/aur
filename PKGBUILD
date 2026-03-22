# Maintainer:
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname="flightcore"
pkgname="$_pkgname"
pkgver=3.2.1
pkgrel=1
pkgdesc="Northstar installer, updater, and launcher"
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
arch=('x86_64')

depends=(
  'bzip2'
  'hicolor-icon-theme'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'npm'
)

options=('!lto')

_pkgsrc="FlightCore-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a25706a2dc23bfad1980b240d1a1e6864ce1b7cac1df1002d900adef2d31b293')

prepare() {
  # Only build the executable
  sed -i '/"bundle": {/,/},/{/"active":/s/true/false/}' "$_pkgsrc/src-tauri/tauri.conf.json"

  # Disable the updater
  sed -i '/"updater": {/,/},/{/"active":/s/true/false/}' "$_pkgsrc/src-tauri/tauri.conf.json"

  # Prioritize IPv4 (some machines have a problem with IPv6)
  export NODE_OPTIONS=--dns-result-order=ipv4first

  # npm dependencies
  export CARGO_HOME="$srcdir/cargo_home"
  export npm_config_cache="$srcdir/npm_cache"

  cd "$_pkgsrc"
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
