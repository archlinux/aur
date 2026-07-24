 pkgname=anitrack
pkgver=0.1.8
pkgrel=1
  pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking"
  arch=("x86_64")
  url="https://github.com/MiguelRegueiro/anitrack-cli"
  license=("GPL-3.0-or-later")
  depends=("ani-cli" "sqlite")
  makedepends=("rust>=1.85" "pkgconf")
  options=("!lto")
  source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
  sha256sums=("d9f5f09041a873ef3de79bcd5731820242cb27ae49cccbf3ea21156d81add4ef")

  prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -Ei 's|^rusqlite[[:space:]]*=.*$|rusqlite = "0.32"|' Cargo.toml
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked
  }

  build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
    cargo build --frozen --release --locked
  }

  package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  }
