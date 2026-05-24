# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=cargo-cooldown
pkgver=0.3.1
pkgrel=1
pkgdesc='Cargo wrapper that enforces a cooldown window for freshly published crates on crates.io for improved supply chain security.'
arch=('aarch64' 'x86_64')
url="https://github.com/dertin/$pkgname"
license=(APACHE MIT)
depends=(glibc libgcc cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('48e5f3582eba7f477dbcb8ff53958436d852e389170611aa68999c00c5a3d6fe108ca76b14a28f06eff67a44ec4d9edbfd82c5375f65ea51dbcb954700509961')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target="$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
