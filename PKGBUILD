# Maintainer: Gaou Piou <i.am.piou@gmail.com>
pkgname=linox-icon-theme-git
pkgver=r15.c03c8bf
pkgrel=2
pkgdesc="A premium squircle-based icon theme for Linux desktops blending macOS aesthetics with native Linux consistency"
arch=('any')
url="https://github.com/abhijeetshewale05/Linox-Icon-Theme"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=linox-icon-theme.install
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/abhijeetshewale05/Linox-Icon-Theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/share/icons"
  cp -r Linox Linox-Blue Linox-Green Linox-Orange Linox-Pink \
        Linox-Purple Linox-Red Linox-Slate Linox-Teal Linox-Yellow Linox-Yaru \
        "$pkgdir/usr/share/icons/"

  # Fix upstream bug: some index.theme files have wrong Name= (copied from Linox-Blue)
  # (https://github.com/abhijeetshewale05/Linox-Icon-Theme/issues/1)
  local variant
  for variant in "$pkgdir/usr/share/icons/Linox"*/; do
    variant="${variant%/}"
    sed -i "s/^Name=.*/Name=${variant##*/}/" "${variant}/index.theme"
  done
}
