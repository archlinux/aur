# Maintainer: erenvly <https://codeberg.org/erenvly>

_pkgbase="zig-waybar-contrib"
pkgname="${_pkgbase}-beta-bin"
epoch=1
pkgver=1.0.1_staging.22
pkgrel=1
pkgdesc='High-performance Waybar modules written in Zig for efficient system monitoring (Beta binary version)'
arch=('x86_64')
url="https://codeberg.org/erenvly/$_pkgbase"
license=('GPL3')
provides=("${_pkgbase}=$pkgver")
conflicts=("$_pkgbase")
optdepends=(
  'fakeroot: updates module'
)
source=(
  "zig-waybar-contrib.zip::https://codeberg.org/erenvly/zig-waybar-contrib/releases/download/1.0.1-staging.22/zig-waybar-contrib-release-1.0.1-staging.22.zip"
  "config.waybar.jsonc::https://codeberg.org/erenvly/zig-waybar-contrib/raw/tag/1.0.1-staging.22/config.waybar.jsonc"
  "LICENSE::https://codeberg.org/erenvly/zig-waybar-contrib/raw/tag/1.0.1-staging.22/LICENSE"
)
sha256sums=('4e9952fad396b9444b31b2acb8798d0c4e296341b0139179c427e52a15b50cb3'
            '1afb0186de869cf7cd8395bd9f75eece4cb41de008072f2bfc903021fd448f59'
            '2299c7882f95e4d84c68a527b7473b6e086a523379bcebb38905c7758a03a472')

package() {
  cd "$srcdir"

  # Extract release artifact into a staging directory
  install -d binaries
  bsdtar -xf zig-waybar-contrib.zip -C binaries

  # Install each binary under the waybar-module- prefix
  for bin in binaries/*; do
    install -Dm755 "$bin" "$pkgdir/usr/bin/waybar-module-$(basename "$bin")"
  done

  install -Dm644 config.waybar.jsonc "$pkgdir/usr/share/$_pkgbase/config.jsonc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
