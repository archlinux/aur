# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="$_pkgbase"
pkgver=0.0.1.r0.g0000000
pkgrel=1
pkgdesc="Lightweight Waybar modules built with Zig (latest git)"
arch=('x86_64')
url="https://github.com/erffy/${_pkgbase}"
license=('GPL3')
source=("git+$url.git")
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

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --tags --long --always 2>/dev/null | sed 's/^v//; s/-/./g'
}

build() {
  cd "$srcdir/$_pkgbase"
  zig build
}

check() {
  cd "$srcdir/$_pkgbase"
  zig build test || echo "No tests available"
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