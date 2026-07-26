# Maintainer: Nathaniel Phelps <138162007+nm-z@users.noreply.github.com>

pkgname=minivna
pkgver=0.1.1
pkgrel=2
pkgdesc='Native Rust CLI for controlling the miniVNA Tiny and collecting VNA measurements'
arch=('x86_64')
url='https://github.com/nm-z/minivna-rs'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('79893c929b67ff468a977905efd3e03634f97742c64cfc83bd9dc2282c276ac50938e95a6268f02b90859262558049c794e183c4f367f25f63eef2fa255f31eb')

prepare() {
  cd "minivna-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "minivna-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "minivna-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-targets
}

package() {
  cd "minivna-rs-$pkgver"
  install -Dm0755 target/release/minivna -t "$pkgdir/usr/bin/"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm0644 README.md minivna.toml -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm0644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
