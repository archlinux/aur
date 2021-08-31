# Contributor: mnussbaum
# Contributor: j.r <j.r@jugendhacker.de>

pkgname=rot8-git
_pkgname="rot8"
pkgver=0.1.3.35.g8043166
pkgrel=2
pkgdesc="A screen rotation daemon "
arch=("x86_64")
url="https://github.com/efernau/rot8"
license=("MIT")
makedepends=("git" "rust" "cargo")
source=("$_pkgname::git+https://github.com/efernau/rot8.git")
sha256sums=("SKIP")
provides=("rot8")
conflicts=("rot8")

pkgver() {
  cd $_pkgname
  echo -n "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/rot8" "$pkgdir/usr/bin/rot8"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
