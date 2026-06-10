# Maintainer: erffy <https://codeberg.org/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="${_pkgbase}-beta-bin"
pkgver=26.06.10
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
  "zig-waybar-contrib.zip::https://codeberg.org/erffy/zig-waybar-contrib/releases/download/26.06.10/zig-waybar-contrib-release-26.06.10.zip"
  "config.waybar.jsonc::https://codeberg.org/erffy/zig-waybar-contrib/raw/tag/26.06.10/config.waybar.jsonc"
  "LICENSE::https://codeberg.org/erffy/zig-waybar-contrib/raw/tag/26.06.10/LICENSE"
)
sha256sums=('6d85a89890dc852b8c4f7195fa0aabbecc37a9981d6959b13f571a63c91802bf'
            'c8f289240068ba61c222720aae665594ab8531f90ba5a23bc948a0ca97c04b2a'
            '4452bc2d13bcd25bdd45ca659672df16c273ab9d1e65c4064447eec382dc96d6')

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
