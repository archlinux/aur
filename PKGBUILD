# Maintainer: revanthnemtoor <revanthnemtoor@github.com>
pkgname=hyperfetch
pkgver=0.2.0.next
pkgrel=1
pkgdesc="A high-performance system fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/revanthnemtoor/hyperfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('hyperfetch-git')
# Note: Pointing to a specific commit since v0.2.0.next tag doesn't exist yet.
_commit=e4aa2daf366c6d757aafb3a5d487886ead4b7c0a
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$_commit"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$_commit"
  cargo build --frozen --release --all-features
  
  # Generate completions
  mkdir -p completions
  ./target/release/hyperfetch completions bash > completions/hyperfetch.bash
  ./target/release/hyperfetch completions fish > completions/hyperfetch.fish
  ./target/release/hyperfetch completions zsh > completions/_hyperfetch
}

package() {
  cd "$pkgname-$_commit"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Install completions
  install -Dm644 completions/hyperfetch.bash "$pkgdir/usr/share/bash-completion/completions/hyperfetch"
  install -Dm644 completions/hyperfetch.fish "$pkgdir/usr/share/fish/vendor_completions.d/hyperfetch.fish"
  install -Dm644 completions/_hyperfetch "$pkgdir/usr/share/zsh/site-functions/_hyperfetch"
}
