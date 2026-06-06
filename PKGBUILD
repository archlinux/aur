pkgname=rnum
pkgver=0.1.3
pkgrel=1
pkgdesc="Rational numbers REPL calculator written in Rust"
arch=('x86_64')
url="https://github.com/davide-leva/rnum"
license=('MIT')
depends=()
makedepends=('rust' 'pkg-config')
source=("https://github.com/davide-leva/rnum/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --jobs "$(nproc)"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Install any produced executable(s) from target/release
  for f in target/release/*; do
    if [ -f "$f" ] && [ -x "$f" ]; then
      base=$(basename "$f")
      case "$base" in
        *.d|*.rlib|*.so) continue ;;
      esac
      # If the compiled binary is named 'calc' but the package is 'rnum',
      # install it as 'rnum' for consistency with the package name.
      if [ "$base" = "calc" ]; then
        destname="$pkgname"
      else
        destname="$base"
      fi
      install -Dm755 "$f" "$pkgdir/usr/bin/$destname"
    fi
  done
  install -d "$pkgdir/usr/share/doc/$pkgname"
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
