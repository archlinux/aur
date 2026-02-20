# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=minot-bin
pkgver=0.5.3
pkgrel=2
pkgdesc="A versatile toolset for debugging and verifying stateful robot perception software."
arch=('x86_64')
url="https://github.com/uos/minot"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=()
options=('!lto' '!strip' '!debug')
source=("$pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/minot-x86_64-unknown-linux-gnu.tar.gz" "$pkgname-$pkgver-src.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP' 'SKIP')
provides=('minot' 'minot-coord' 'wind-rat' 'rat')

package() {
  install -Dm755 "$srcdir/minot-x86_64-unknown-linux-gnu/rat/minot" "$pkgdir/usr/bin/minot"   
  install -Dm755 "$srcdir/minot-x86_64-unknown-linux-gnu/minot-coord" "$pkgdir/usr/bin/minot-coord"
  install -Dm755 "$srcdir/minot-x86_64-unknown-linux-gnu/wind-rat" "$pkgdir/usr/bin/wind-rat"
  install -Dm755 "$srcdir/minot-x86_64-unknown-linux-gnu/librat.so" "$pkgdir/usr/lib/librat.so"
  install -Dm755 "$srcdir/minot-x86_64-unknown-linux-gnu/librat.a" "$pkgdir/usr/lib/librat.a"
  install -Dm644 "$srcdir/minot-x86_64-unknown-linux-gnu/rat.h" "$pkgdir/usr/include/rat.h"

  install -Dm644 "$srcdir/minot-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/minot/LICENSE-MIT" || true
  install -Dm644 "$srcdir/minot-$pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/minot/LICENSE-APACHE" || true

  ( cd "$srcdir/minot-$pkgver/docs" && \
  find . -type f -name '*.md' \
       -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/minot/{}" \; )

  install -Dm644 "$srcdir/minot-$pkgver/README.md" "$pkgdir/usr/share/doc/minot/README.md"
  install -Dm644 "$srcdir/minot-$pkgver/mt_rat/librat.pc" "$pkgdir/usr/lib/pkgconfig/librat.pc"

  "$pkgdir/usr/bin/minot" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/minot"
  "$pkgdir/usr/bin/minot" completions zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_minot"
  "$pkgdir/usr/bin/minot" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/minot.fish"
}
