# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=minot
pkgver=0.10.1
pkgrel=7
pkgdesc="A versatile toolset for debugging and verifying stateful robot perception software."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/minot"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'git')
options=('!lto' '!debug')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')
provides=('librat')
conflicts=('librat')

build() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cd "$srcdir/$pkgname"
  cargo build --release --locked --no-default-features --features embed-mt-pubsub,embed-coord

  # cd "$srcdir/$pkgname-$pkgver/docs/" && zensical build --clean && cd -

  mkdir -p "$srcdir/completions"
  "$CARGO_TARGET_DIR/release/minot" completions bash > "$srcdir/completions/bash"
  "$CARGO_TARGET_DIR/release/minot" completions zsh  > "$srcdir/completions/_zsh"
  "$CARGO_TARGET_DIR/release/minot" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/target/release/minot" "$pkgdir/usr/bin/minot"

  install -Dm755 "$srcdir/target/release/librat.so" "$pkgdir/usr/lib/librat.so"
  install -Dm755 "$srcdir/target/release/librat.a" "$pkgdir/usr/lib/librat.a"
  install -Dm644 "$srcdir/$pkgname/mt_rat/rat.h" "$pkgdir/usr/include/rat.h"
  install -Dm644 "$srcdir/$pkgname/mt_rat/librat.pc" "$pkgdir/usr/lib/pkgconfig/librat.pc"

  install -Dm644 "$srcdir/$pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "$srcdir/$pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

  # install -d "$pkgdir/usr/share/doc/$pkgname"
  # cp -a "$srcdir/$pkgname-$pkgver/docs/site/." "$pkgdir/usr/share/doc/$pkgname/"
  # find "$pkgdir/usr/share/doc/$pkgname/" -type d -exec chmod 755 {} +
  # find "$pkgdir/usr/share/doc/$pkgname/" -type f -exec chmod 644 {} +

  install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/minot"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_minot"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/minot.fish"
}
