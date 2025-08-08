# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname=${_pkgbase}
pkgver=0.0.1
pkgrel=0
pkgdesc="Lightweight Waybar modules built with Zig"
arch=('x86_64')
url="https://github.com/erffy/zig-waybar-contrib"
license=('GPL3')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')
depends=()
makedepends=('git' 'zig>=0.14.0')
optdepends=(
  'rocm-smi-lib: AMD GPU BACKEND'
  'amdsmi: AMD GPU BACKEND'
  'cuda: NVIDIA GPU BACKEND'
)

build() {
  cd "$srcdir/$pkgname"
  zig build
}

package() {
  cd "$srcdir/$pkgname/zig-out/bin"
  for bin in *; do
    [[ -x "$bin" && ! -d "$bin" ]] || continue
    install -Dm755 "$bin" "$pkgdir/usr/bin/waybar-module-${bin}-bin"
  done

  install -Dm644 "$srcdir/$pkgname/config.waybar.jsonc" "$pkgdir/etc/zig-waybar-contrib/config.jsonc"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
