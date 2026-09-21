 pkgname=anitrack
pkgver=0.1.11
pkgrel=1
  pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking"
  arch=("x86_64")
  url="https://github.com/MiguelRegueiro/anitrack-cli"
  license=("GPL-3.0-or-later")
  depends=("ani-cli" "sqlite")
  makedepends=("rust>=1.85" "pkgconf")
  options=("!lto")
  source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('9e0d4ad33d57aa9a851b737f7ee2784c994b3e7482e6a610f119ea3b41bbb4a2')

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
