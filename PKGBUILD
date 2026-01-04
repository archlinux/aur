# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="$_pkgbase"
pkgver=1.4.2
pkgrel=6
pkgdesc='High-performance Waybar modules written in Zig for efficient system monitoring'
arch=('x86_64')
url="https://codeberg.org/erffy/$_pkgbase"
license=('GPL3')
provides=("zig-waybar-contrib=$pkgver")
conflicts=('zig-waybar-contrib')
depends=('fakeroot')
makedepends=('git' 'zig>=0.15.0')
optdepends=(
  'rocm-smi-lib: AMD GPU Backend'
  'amdsmi: AMD GPU Backend'
  'cuda: NVIDIA GPU Backend'
)
source=("$_pkgbase::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$_pkgbase"
  
  zig build -Drelease
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