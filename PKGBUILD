# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=sounding
pkgver=0.4.0
pkgrel=1
pkgdesc="A SLAM evaluation tool."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/sounding"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
provides=('sounding')
conflicts=('sounding')

build() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cd $srcdir/$pkgname
  cargo build --release --features rerun --locked

  mkdir -p "$srcdir/completions"
  "$CARGO_TARGET_DIR/release/sounding" completions bash > "$srcdir/completions/bash"
  "$CARGO_TARGET_DIR/release/sounding" completions zsh  > "$srcdir/completions/_zsh"
  "$CARGO_TARGET_DIR/release/sounding" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/target/release/sounding" "$pkgdir/usr/bin/sounding"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/sounding"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_sounding"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/sounding.fish"
}
