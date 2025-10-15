# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="$_pkgbase"
pkgver=1.4.1
pkgrel=1
pkgdesc="High-performance Waybar modules written in Zig for efficient system monitoring"
arch=('x86_64')
url="https://github.com/erffy/${_pkgbase}"
license=('GPL3')
source=("git+$url.git#tag=$pkgver")
md5sums=('SKIP')

depends=()
makedepends=('git' 'zig>=0.15.0')
optdepends=(
  'rocm-smi-lib: AMD GPU backend'
  'amdsmi: AMD GPU backend'
  'cuda: NVIDIA GPU backend'
)

provides=("$_pkgbase")
conflicts=("$_pkgbase")

build() {
  cd "$srcdir/$_pkgbase"
  zig build -Drelease
}

package() {
  cd "$srcdir/$_pkgbase/zig-out/bin"

  for bin in *; do
    [[ -x "$bin" && ! -d "$bin" ]] || continue
    install -Dm755 "$bin" "$pkgdir/usr/bin/waybar-module-$bin"
  done

  install -Dm644 "$srcdir/$_pkgbase/config.waybar.jsonc" "$pkgdir/etc/zig-waybar-contrib/config.jsonc"
  install -Dm644 "$srcdir/$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}