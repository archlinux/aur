# Maintainer: Microck <contact@micr.dev>

pkgname=kagi-cli
pkgver=0.6.1
pkgrel=1
pkgdesc="Agent-native CLI for Kagi subscribers with JSON-first search output"
arch=('x86_64' 'aarch64')
url="https://github.com/Microck/kagi-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('kagi')
conflicts=('kagi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b97cda1ebeba6694ed8b39604a00bbdf9a4a4c9c2b82c7966feb6725c0a15dec')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release

  # Generate shell completions
  ./target/release/kagi --generate-completion bash > completions.bash
  ./target/release/kagi --generate-completion zsh > completions.zsh
  ./target/release/kagi --generate-completion fish > completions.fish
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  # Binary
  install -Dm755 target/release/kagi "$pkgdir/usr/bin/kagi"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Completions
  install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/kagi"
  install -Dm644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_kagi"
  install -Dm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/kagi.fish"
}
