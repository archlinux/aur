# Maintainer: Ilyas Khallouki <khalloukielias@gmail.com>
#
# Builds from a release tag. For the git version, change to waytify-git, source
# from the repository, and add a pkgver() function.
pkgname=waytify
pkgver=0.1.0
pkgrel=1
pkgdesc="Media control for Waybar: MPRIS core, GTK4 layer-shell player window"
arch=('x86_64' 'aarch64')
url="https://github.com/IlyasKhallouki/waytify"
license=('MIT')
# libpulse is not optional: the binary links against it for the player's own
# volume, so a package without it installs and then fails to start.
depends=('gtk4' 'gtk4-layer-shell' 'dbus' 'libpulse')
makedepends=('cargo')
optdepends=('waybar: the bar module, which is what most people came for')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb4c1e30fe8bd1cc1c8b07389b6c5f08b9eabc58dc1671ecc4b59175e8eb72fe')

prepare() {
  cd "$pkgname-$pkgver"
  # Fetch dependencies up front so build() can run offline, which is what a
  # clean chroot build expects.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package waytify
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # The end-to-end tests need a session bus and skip without one, so give them a
  # private one rather than letting them quietly pass having tested nothing.
  dbus-run-session -- cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 docs/THEMING.md "$pkgdir/usr/share/doc/$pkgname/THEMING.md"
  install -Dm0644 docs/ARCHITECTURE.md "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
  install -Dm0644 contrib/waybar/custom-waytify.jsonc \
    "$pkgdir/usr/share/doc/$pkgname/custom-waytify.jsonc"
  install -Dm0644 contrib/waybar/waytify.css \
    "$pkgdir/usr/share/doc/$pkgname/waytify.css"
  # A worked theme, which is the fastest way to see what the art colours do.
  install -Dm0644 contrib/themes/burning-cherry.css \
    "$pkgdir/usr/share/doc/$pkgname/themes/burning-cherry.css"
}
