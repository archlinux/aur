# Maintainer: Takahashi Rinta <mc1586182829@outlook.com>
pkgname=saiku
pkgver=1.0.0
pkgrel=1
pkgdesc='DSH-powered coding agent with a terminal UI and headless workers'
arch=('x86_64' 'aarch64')
url='https://github.com/ProjectArcturius/saiku'
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc' 'nodejs>=24' 'npm' 'git')
makedepends=('cargo')
source=("$pkgname-$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('d9a9898c3702249e348e5c315fde7acdea8f95432bbcb8bdecd6a7044b4aa01f')
options=('!lto')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked --offline --no-default-features -p arc-deck-cli
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --locked --offline -p arc-deck-core -p arc-deck-dsh -p arc-deck-tui -p arc-deck-cli --features arc-deck-cli/test-runtime
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/target/release/saiku" "$pkgdir/usr/bin/saiku"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 crates/arc-deck-tui/LICENSE-OpenCode "$pkgdir/usr/share/licenses/$pkgname/LICENSE-OpenCode"
  install -Dm644 NOTICE "$pkgdir/usr/share/doc/$pkgname/NOTICE"
  install -Dm644 docs/INSTALL.md "$pkgdir/usr/share/doc/$pkgname/INSTALL.md"
}
