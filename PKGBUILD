# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=dedrunk
pkgver=0.1.0
pkgrel=1
pkgdesc="Kalibr IMU calibration from MCAP recordings."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/dedrunk"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
provides=('dedrunk')
conflicts=('dedrunk')

build() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cd $srcdir/$pkgname
  cargo build --release --locked

  mkdir -p "$srcdir/completions"
  "$CARGO_TARGET_DIR/release/dedrunk" completions bash > "$srcdir/completions/bash"
  "$CARGO_TARGET_DIR/release/dedrunk" completions zsh  > "$srcdir/completions/_zsh"
  "$CARGO_TARGET_DIR/release/dedrunk" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/target/release/dedrunk" "$pkgdir/usr/bin/dedrunk"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/dedrunk"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_dedrunk"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/dedrunk.fish"
}
