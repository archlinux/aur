# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=fluent-gtk-theme-git
pkgver=2021.05.07.r39.g3c288b6
pkgrel=1
pkgdesc="Fluent design gtk theme for linux desktops"
arch=('any')
url="https://www.pling.com/p/1477941"
license=('GP3')
depends=('gnome-themes-extra')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'fluent-icon-theme: Matching icon theme'
            'fluent-cursor-theme: Matching cursor theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Fluent-gtk-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks round -d "$pkgdir/usr/share/themes"

  # Remove unnecessary files:
  rm -rf "$pkgdir"/usr/share/themes/{Fluent,Fluent-*}/gnome-shell/extensions

  # Plank theme
  install -Dm644 src/plank/dock.theme -t "$pkgdir/usr/share/plank/themes/Fluent"

  # Wallpapers
  install -d "$pkgdir/usr/share/backgrounds/${pkgname%-git}"
  cp -r src/wallpaper/wallpaper-* \
    "$pkgdir/usr/share/backgrounds/${pkgname%-git}"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/firefox "$pkgdir/usr/share/doc/${pkgname%-git}"

  # Dash to dock theme
  cp -r src/dash-to-dock "$pkgdir/usr/share/doc/${pkgname%-git}"

  ## Fix for Dash to panel
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}/gnome-shell/extensions"
  cp -r src/gnome-shell/extensions/dash-to-panel \
    "$pkgdir/usr/share/doc/${pkgname%-git}/gnome-shell/extensions"
}
