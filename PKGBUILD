# Maintainer: l1a <634380+l1a@users.noreply.github.com>
pkgname=retch
pkgver=0.6.23
pkgrel=1
pkgdesc="A fast, feature-rich system information fetcher written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/l1a/retch"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'mandown')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf51f58b97adf6dda271eb197bea2cecac7e0fad0475f355962bb0a485f1a8bd')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --frozen
  
  # Generate man page
  DATE=$(date +"%B %Y")
  mandown docs/retch.1.md RETCH 1 | sed -e 's/\\fB\\fB/\\fB/g' -e 's/\\fP\\fP/\\fP/g' -e "s/\\.TH \"RETCH\" 1/\\.TH \"RETCH\" \"1\" \"\$DATE\" \"retch \$pkgver\" \"System Information Fetcher\"/" > docs/retch.1
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install binary
  install -Dm755 "target/release/retch" "$pkgdir/usr/bin/retch"
  
  # Install man page
  install -Dm644 "docs/retch.1" "$pkgdir/usr/share/man/man1/retch.1"
  
  # Install shell completions
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  
  "$pkgdir/usr/bin/retch" --completions bash > "$pkgdir/usr/share/bash-completion/completions/retch"
  "$pkgdir/usr/bin/retch" --completions zsh > "$pkgdir/usr/share/zsh/site-functions/_retch"
  "$pkgdir/usr/bin/retch" --completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/retch.fish"
  
  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
