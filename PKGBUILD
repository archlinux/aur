# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="$_pkgbase"
pkgver=1.4.2
pkgrel=5
pkgdesc='High-performance Waybar modules written in Zig for efficient system monitoring'
arch=('x86_64')
url="https://codeberg.org/erffy/$_pkgbase"
license=('GPL3')
depends=()
makedepends=('git' 'zig>=0.15.0')
optdepends=(
  'fakeroot: required for the updates module'
  'rocm-smi-lib: AMD GPU Backend'
  'amdsmi: AMD GPU Backend'
  'cuda: NVIDIA GPU Backend'
)
source=("$_pkgbase::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$_pkgbase"
  
  zig build --summary all -Drelease
}

package() {
  cd "$_pkgbase"
  
  for bin in zig-out/bin/*; do
    [[ -x "$bin" && -f "$bin" ]] || continue
    install -Dm755 $bin "$pkgdir/usr/bin/waybar-module-$bin"
  done
  
  install -Dm644 config.waybar.jsonc "$pkgdir/usr/share/$_pkgbase/config.jsonc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}