# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=tgrep
pkgver=1.1.0
pkgrel=1
pkgdesc='Trigram-indexed grep: fast regex search for large codebases with a client/server architecture'
arch=('x86_64' 'aarch64')
url='https://github.com/microsoft/tgrep'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/tgrep/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a9f136ff8f52175231091ae7710dafb946fd85021efcb62ff5deca4bcb1ac09')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --workspace
}

check() {
  cd "$pkgname-$pkgver"
  # `search::tests::stats_requests_match_detail_so_spans_are_available_to_count`
  # asserts on SearchOptions::default(), whose ColorMode::Auto reads
  # `io::stdout().is_terminal()`. In a terminal that returns true and the
  # assertion fails; in CI the stdout is a pipe and it passes. Pipe the output
  # so the tests see the same non-tty stdout as upstream CI, and keep the exit
  # status of cargo rather than of the pipe consumer.
  set -o pipefail
  cargo test --release --frozen --workspace 2>&1 | cat
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tgrep "$pkgdir/usr/bin/tgrep"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
