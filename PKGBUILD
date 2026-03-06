# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=minot-bin
pkgver=0.6.0
pkgrel=3
pkgdesc="A versatile toolset for debugging and verifying stateful robot perception software."
arch=('x86_64')
url="https://github.com/uos/minot"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('zensical')
options=('!lto' '!strip' '!debug')
source=("$pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/minot-$CARCH-unknown-linux-gnu.tar.gz" "$pkgname-$pkgver-src.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP' 'SKIP')
provides=('minot' 'minot-coord' 'wind-rat' 'librat')
conflicts=('minot' 'minot-coord' 'wind-rat' 'librat')

build() {
  cd "$srcdir/minot-$pkgver/docs/" && zensical build --clean && cd -

  MINOT_CLI_PATH="$srcdir/minot-$CARCH-unknown-linux-gnu/rat/minot"
  mkdir -p "$srcdir/completions"
  "$MINOT_CLI_PATH" completions bash > "$srcdir/completions/bash"
  "$MINOT_CLI_PATH" completions zsh  > "$srcdir/completions/_zsh"
  "$MINOT_CLI_PATH" completions fish > "$srcdir/completions/fish"
}


package() {
  install -Dm755 "$srcdir/minot-$CARCH-unknown-linux-gnu/rat/minot" "$pkgdir/usr/bin/minot"
  install -Dm755 "$srcdir/minot-$CARCH-unknown-linux-gnu/minot-coord" "$pkgdir/usr/bin/minot-coord"
  install -Dm755 "$srcdir/minot-$CARCH-unknown-linux-gnu/wind-rat" "$pkgdir/usr/bin/wind-rat"
  install -Dm755 "$srcdir/minot-$CARCH-unknown-linux-gnu/librat.so" "$pkgdir/usr/lib/librat.so"
  install -Dm755 "$srcdir/minot-$CARCH-unknown-linux-gnu/librat.a" "$pkgdir/usr/lib/librat.a"
  install -Dm644 "$srcdir/minot-$CARCH-unknown-linux-gnu/rat.h" "$pkgdir/usr/include/rat.h"
  install -Dm644 "$srcdir/minot-$pkgver/mt_rat/librat.pc" "$pkgdir/usr/lib/pkgconfig/librat.pc"

  install -Dm644 "$srcdir/minot-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/minot/LICENSE-MIT"
  install -Dm644 "$srcdir/minot-$pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/minot/LICENSE-APACHE"

  install -d "$pkgdir/usr/share/doc/minot"
  cp -a "$srcdir/minot-$pkgver/docs/site/." "$pkgdir/usr/share/doc/minot/"
  find "$pkgdir/usr/share/doc/minot/" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/doc/minot/" -type f -exec chmod 644 {} +

  install -Dm644 "$srcdir/minot-$pkgver/README.md" "$pkgdir/usr/share/doc/minot/README.md"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/minot"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_minot"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/minot.fish"
}
