# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=marina-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/marina"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=()
options=('!lto' '!strip' '!debug')
source_x86_64=(
  "marina-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/marina-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('SKIP')
source_aarch64=(
  "marina-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/marina-$pkgver-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=('SKIP')
provides=('marina')
conflicts=('marina')

build() {
  export MARINA="$srcdir/marina-$pkgver/marina"
  chmod 755 $MARINA

  mkdir -p "$srcdir/completions"
  export MARINA_CONFIG_DIR=$(mktemp -d)
  export MARINA_CACHE_DIR=$(mktemp -d)
  "$MARINA" completions bash > "$srcdir/completions/bash"
  "$MARINA" completions zsh  > "$srcdir/completions/_zsh"
  "$MARINA" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/marina-$pkgver/marina" "$pkgdir/usr/bin/marina"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/marina"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_marina"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/marina.fish"
}
