# Maintainer: Velamniro <velamniro at proton dot me>

pkgname=msyt
pkgver=1.2.1
pkgrel=3
pkgdesc="Import and export from MSBT files to YAML or JSON files."
arch=('x86_64')
url='https://github.com/NiceneNerd/msyt'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b8db7fce49962eded173a5a8b51fc2a802d46f7f421f4a883a9731a8f28f0aa550dc3299085909d78faa45cd9e239faaa4c9d6b0709266d221a8832a0d6605d8')

prepare() {
  cd "$pkgname-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  # The source doesn't have Cargo.lock file, so no "--locked"
  cargo fetch --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
