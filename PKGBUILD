# Maintainer: stelzo <stelzo@steado.de>
pkgname=ratslang
pkgver=0.5.0
pkgrel=1
pkgdesc="Configuration language for building physical systems in Rust: CLI and language server"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/ratslang"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'git')
options=('!lto' '!debug')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cd "$srcdir/$pkgname"
  cargo build --release --locked --package ratslang-cli --package ratslang-lsp
}

check() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cd "$srcdir/$pkgname"
  cargo test --release --locked --package ratslang-cli
}

package() {
  install -Dm755 "$srcdir/target/release/ratslang" "$pkgdir/usr/bin/ratslang"
  install -Dm755 "$srcdir/target/release/ratslang-lsp" "$pkgdir/usr/bin/ratslang-lsp"

  install -Dm644 "$srcdir/$pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "$srcdir/$pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
