# Maintainer: mellen <mellen@heatsync.org>
#
# Deliberately does NOT declare provides=('heatsync') or conflicts=('heatsync').
# An unrelated MIT project of the same name ships `heatsync-bin` on the AUR and
# that package claims both. Ours installs /usr/bin/heatsync-tui, so the two can
# sit on the same machine without pacman having to pick one.

pkgname=heatsync-tui
pkgver=0.1.1
pkgrel=1
pkgdesc='heat-sorted live multichat in the terminal — twitch + kick, real emotes, vim keys'
arch=('x86_64' 'aarch64')
url='https://github.com/mellen9999/heatsync-tui'
license=('MIT')
# ring's C/asm objects break under makepkg's default LTO — undefined
# ring_core_* symbols at link. Standard fix for ring-dependent Rust crates.
options=('!lto')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d360df7b8b82a1065c69f0fdc5cc97e1a291fb01b08913161314e8a8c489edbb')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
