# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=marina
pkgver=0.2.5
pkgrel=1
pkgdesc="A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/marina"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
provides=('marina')
conflicts=('marina')

build() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cd $srcdir/$pkgname
  cargo build --release --locked

  mkdir -p "$srcdir/completions"
  export MARINA_CONFIG_DIR=$(mktemp -d)
  export MARINA_CACHE_DIR=$(mktemp -d)
  "$CARGO_TARGET_DIR/release/marina" completions bash > "$srcdir/completions/bash"
  "$CARGO_TARGET_DIR/release/marina" completions zsh  > "$srcdir/completions/_zsh"
  "$CARGO_TARGET_DIR/release/marina" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/target/release/marina" "$pkgdir/usr/bin/marina"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/marina"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_marina"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/marina.fish"
}
