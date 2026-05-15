# Maintainer: Gaou Piou <i.am.piou@gmail.com>
pkgname=pebble-icon-theme-git
pkgver=r42.185da58
pkgrel=1
pkgdesc="A premium squircle-based icon theme for Linux desktops blending macOS aesthetics with native Linux consistency"
arch=('any')
url="https://github.com/abhijeetshewale05/Pebble-Icon-Theme"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('linox-icon-theme-git' 'linox-icon-theme')
install=pebble-icon-theme.install
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/abhijeetshewale05/Pebble-Icon-Theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/share/icons"
  cp -r Pebble Pebble-Blue Pebble-Green Pebble-Orange Pebble-Pink \
        Pebble-Purple Pebble-Red Pebble-Slate Pebble-Teal Pebble-Yellow Pebble-Yaru \
        "$pkgdir/usr/share/icons/"

  # Fix upstream bug: some index.theme files have wrong Name= (copied from Pebble-Blue)
  local variant
  for variant in "$pkgdir/usr/share/icons/Pebble"*/; do
    variant="${variant%/}"
    sed -i "s/^Name=.*/Name=${variant##*/}/" "${variant}/index.theme"
  done
}
