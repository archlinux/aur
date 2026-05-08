# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="${_pkgbase}-beta-bin"
pkgver=26.05.08
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
  "zig-waybar-contrib.zip::https://codeberg.org/erffy/zig-waybar-contrib/releases/download/26.05.08/zig-waybar-contrib-release-26.05.08.zip"
  "config.waybar.jsonc::https://codeberg.org/erffy/zig-waybar-contrib/raw/tag/26.05.08/config.waybar.jsonc"
  "LICENSE::https://codeberg.org/erffy/zig-waybar-contrib/raw/tag/26.05.08/LICENSE"
)
md5sums=('2f5d50624eba208caaa0433a91fc5ce4'
         '93ed2d07501c3e0ed7c0132d0265548b'
         'f1c10f726262b56101b2112a4ec181d2')

package() {
  cd "$srcdir"

  # Extract release artifact into a staging directory
  install -d binaries
  bsdtar -xf zig-waybar-contrib.zip -C binaries

  # Install each binary under the waybar-module- prefix
  for bin in binaries/*; do
    install -Dm755 "$bin" "$pkgdir/usr/bin/waybar-module-$(basename "$bin")"
  done

  # Patch the placeholder path in the bundled config
  sed -i 's|{{EXECUTABLE_PATH}}|/usr/bin|g' config.waybar.jsonc

  install -Dm644 config.waybar.jsonc "$pkgdir/usr/share/$_pkgbase/config.jsonc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
