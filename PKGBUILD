# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=minot
pkgver=0.5.3
pkgrel=3
pkgdesc="A versatile toolset for debugging and verifying stateful robot perception software."
arch=('x86_64')
url="https://github.com/uos/minot"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
provides=('minot' 'minot-coord' 'wind-rat' 'rat')

build() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked --features embed-ratpub
}

package() {
  install -Dm755 "$srcdir/target/release/minot" "$pkgdir/usr/bin/minot"   
  install -Dm755 "$srcdir/target/release/minot-coord" "$pkgdir/usr/bin/minot-coord"
  
  install -Dm755 "$srcdir/target/release/wind-rat" "$pkgdir/usr/bin/wind-rat"
  install -Dm755 "$srcdir/target/release/librat.so" "$pkgdir/usr/lib/librat.so"
  install -Dm755 "$srcdir/target/release/librat.a" "$pkgdir/usr/lib/librat.a"
  install -Dm644 "$srcdir/$pkgname-$pkgver/mt_rat/rat.h" "$pkgdir/usr/include/rat.h"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" || true
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" || true

  ( cd "$srcdir/$pkgname-$pkgver/docs" && \
  find . -type f -name '*.md' \
       -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$pkgname/{}" \; )

  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/mt_rat/librat.pc" "$pkgdir/usr/lib/pkgconfig/librat.pc"

  "$pkgdir/usr/bin/minot" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/minot"
  "$pkgdir/usr/bin/minot" completions zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_minot"
  "$pkgdir/usr/bin/minot" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/minot.fish"
}
