# Maintainer: revanthnemtoor <revanthnemtoor@github.com>
pkgname=hyperfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A high-performance system fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/revanthnemtoor/hyperfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('fetch')
conflicts=('hyperfetch-git')
# Note: Pointing to a specific commit since v0.1.0 tag doesn't exist yet.
_commit=fe940ceeaab5e22abf987936790546efacc72962
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
  
  # Generate man page
  ./target/release/hyperfetch man > hyperfetch.1
}

package() {
  cd "$pkgname-$_commit"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Install completions
  install -Dm644 completions/hyperfetch.bash "$pkgdir/usr/share/bash-completion/completions/hyperfetch"
  install -Dm644 completions/hyperfetch.fish "$pkgdir/usr/share/fish/vendor_completions.d/hyperfetch.fish"
  install -Dm644 completions/_hyperfetch "$pkgdir/usr/share/zsh/site-functions/_hyperfetch"
  
  # Install man page
  install -Dm644 hyperfetch.1 "$pkgdir/usr/share/man/man1/hyperfetch.1"
}
