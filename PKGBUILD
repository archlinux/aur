# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="${_pkgbase}-beta-bin"
pkgver=2.0.0
pkgrel=5
pkgdesc='High-performance Waybar modules written in Zig for efficient system monitoring (Beta binary version)'
arch=('x86_64')
url="https://codeberg.org/erffy/$_pkgbase"
license=('GPL3')
provides=("zig-waybar-contrib=$pkgver")
conflicts=('zig-waybar-contrib')
optdepends=(
  'fakeroot: updates module'
)
source=(
  "zig-waybar-contrib.zip::${url}/actions/runs/2504346/artifacts/zig-waybar-contrib-x86_64-linux-gnu"
  "config.waybar.jsonc::${url}/raw/branch/0.16.x-staging/config.waybar.jsonc"
  "LICENSE::${url}/raw/branch/0.16.x-staging/LICENSE"
)
md5sums=(
  '352abfeb532198f0009e987969f4ff06' 
  '68adcbe6d340c78643634d1ef4087b5e'
  'f1c10f726262b56101b2112a4ec181d2'
)

package() {
  cd "$srcdir"

  # Create extraction directory
  mkdir -p binaries

  # Extract artifact into it
  bsdtar -xf zig-waybar-contrib.zip -C binaries

  # Install binaries
  for bin in binaries/*; do
    install -Dm755 $bin "$pkgdir/usr/bin/waybar-module-$(basename "$bin")"
  done

  # Replace executable path
  sed -i 's|{{EXECUTABLE_PATH}}|/usr/bin|g' config.waybar.jsonc

  # Install config
  install -Dm644 config.waybar.jsonc "$pkgdir/usr/share/$_pkgbase/config.jsonc"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
