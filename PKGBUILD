# Maintainer: Nathaniel Phelps <138162007+nm-z@users.noreply.github.com>

pkgname=minivna
pkgver=0.1.0
pkgrel=1
pkgdesc='Native CLI for automated Tiny vector network analyzer data collection'
arch=('x86_64')
url='https://github.com/nm-z/minivna-rs'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('741b0d1980a6ef9e77bafd5151d87102d3f9b08127aad8bee0231b73ef2b29a8c69511cf3b6c341469d73e1e0a97a733ce8295c28d5136a1d56396168741e44b')

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
