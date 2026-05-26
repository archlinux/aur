# Maintainer: Microck <contact@micr.dev>

pkgname=kagi-cli
pkgver=0.7.0
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
sha256sums=('605b40f50b8dd43677910174ee7435d1e55590e108e94563c56e6b06237cc6d2')

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
