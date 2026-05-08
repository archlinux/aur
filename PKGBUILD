# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="${_pkgbase}"
pkgver=26.05.08
pkgrel=1
pkgdesc='High-performance Waybar modules written in Zig for efficient system monitoring (Stable binary version)'
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
sha256sums=('3e2f97afac4ad3bac72b6a9a3e15567342e093bd97f863d9285c6118d0403c92'
            'c8f289240068ba61c222720aae665594ab8531f90ba5a23bc948a0ca97c04b2a'
            '85bd785ac7046ba5459184a5c119c614ee0016fbfe128367e602e7a30661dd66')

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
