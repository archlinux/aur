# Maintainer: Microck <contact@micr.dev>

pkgname=kagi-cli
pkgver=0.4.5
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
sha256sums=('25d5ab50b3d54de6b2cc0c34e8be1b616c99e3221c4863ab7e41ea52ba825079')

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
