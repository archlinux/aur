# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="${_pkgbase}-beta-bin"
pkgver=26.02.21
pkgrel=1
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
  "zig-waybar-contrib.zip::https://codeberg.org/erffy/zig-waybar-contrib/releases/download/26.02.21/zig-waybar-contrib-release-26.02.21.zip"
  "config.waybar.jsonc::CONFIG_https://codeberg.org/erffy/zig-waybar-contrib/releases/download/26.02.21/zig-waybar-contrib-release-26.02.21.zip"
  "LICENSE::LICENSE_https://codeberg.org/erffy/zig-waybar-contrib/releases/download/26.02.21/zig-waybar-contrib-release-26.02.21.zip"
)
md5sums=('c6902cdc289035892c6b2cb83290142a'
         '93ed2d07501c3e0ed7c0132d0265548b'
         'f1c10f726262b56101b2112a4ec181d2')

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
