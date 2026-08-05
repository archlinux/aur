# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

# Its own AUR package rather than a split of `wdm`, so that installing the GTK
# greeter does not build the WebKitGTK one — and so that someone who wants
# neither never has GTK4 in their build chroot. wdm depends on the virtual this
# provides, so pacman offers this as one of the choices when `wdm` is installed
# on its own.
pkgname=wdm-gtk-greeter
pkgver=0.8.0
pkgrel=1
pkgdesc='GTK4 greeter for wdm'
arch=('x86_64' 'aarch64')
url='https://github.com/quinnjr/wdm'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
# gtk4-layer-shell is not optional: wdm advertises no xdg_toplevel at all, so a
# window that is not a layer surface is closed the moment it is created.
makedepends=('cargo' 'libxkbcommon' 'gtk4' 'gtk4-layer-shell')
provides=('wdm-greeter-implementation')
source=("wdm-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# See the note in the `wdm` package: this is the checksum of the tarball GitHub
# published, and all four wdm packages build from the same one.
sha256sums=('8928a26d7b192fa739ed5e9f11013d88f6dcc604c9f58b88edee82c9682a39cd')

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
  # This crate only. Cargo pulls in wdm-protocol and wdm-greeter-client as path
  # dependencies and stops there, so neither the compositor nor the WebKitGTK
  # greeter is compiled and webkitgtk-6.0 is not needed to build this at all.
  cargo build --frozen --release -p wdm-gtk-greeter
}

check() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  # The greeter's own tests plus the client it shares with the WebKitGTK
  # greeter; both are pure logic and need no display.
  cargo test --frozen --release -p wdm-gtk-greeter -p wdm-greeter-client
}

package() {
  cd "$_src"
  install -Dm755 target/release/wdm-gtk-greeter "$pkgdir/usr/lib/wdm/wdm-gtk-greeter"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
