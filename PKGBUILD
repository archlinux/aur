# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

# Its own AUR package rather than a split of `wdm`: WebKitGTK is the heaviest
# dependency in the project by a wide margin, and before the packaging was split
# every wdm user built against it whether or not they wanted this greeter. wdm
# depends on the virtual this provides, so pacman offers this as one of the
# choices when `wdm` is installed on its own.
pkgname=wdm-webkit-greeter
pkgver=0.3.0
pkgrel=1
pkgdesc='WebKitGTK greeter for wdm, with themes written in HTML, CSS and JavaScript'
arch=('x86_64' 'aarch64')
url='https://github.com/quinnjr/wdm'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'webkitgtk-6.0')
makedepends=('cargo' 'libxkbcommon' 'gtk4' 'gtk4-layer-shell' 'webkitgtk-6.0')
provides=('wdm-greeter-implementation')
source=("wdm-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# See the note in the `wdm` package: this is the checksum of the tarball GitHub
# published, and all three wdm packages build from the same one.
sha256sums=('6bb8ce1ba62c87062ecd2d1e74c9fb1eb1b5b3bf4703efde60fee86fed6b545c')

# The tarball is the whole workspace whatever the pkgbase is, so the source
# directory is named for the project rather than for this package.
_src="wdm-$pkgver"

prepare() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # This crate only; see the GTK greeter's build() for why the scoping matters.
  cargo build --frozen --release -p wdm-webkit-greeter
}

check() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  # Includes the drift check that asserts the shipped theme and the docs still
  # name every field the injected JavaScript API exposes.
  cargo test --frozen --release -p wdm-webkit-greeter -p wdm-greeter-client
}

package() {
  cd "$_src"
  install -Dm755 target/release/wdm-webkit-greeter "$pkgdir/usr/lib/wdm/wdm-webkit-greeter"

  # Themes are data, not documentation: the greeter refuses to start without the
  # one it was pointed at, and the default is the worked example of the
  # JavaScript API a theme author copies.
  local themes="$pkgdir/usr/share/wdm/webkit-greeter/themes"
  install -Dm644 -t "$themes/default" \
    crates/wdm-webkit-greeter/themes/default/index.html \
    crates/wdm-webkit-greeter/themes/default/style.css \
    crates/wdm-webkit-greeter/themes/default/theme.js

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
