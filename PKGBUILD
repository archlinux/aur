# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=orchis-theme-git
pkgver=2021.12.13.r3.g97d7205
pkgrel=2
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
arch=('any')
url="https://www.pling.com/p/1357889"
license=('GPL2')
depends=('gtk3' 'gnome-themes-extra')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'kvantum-theme-orchis: Matching Kvantum theme'
            'tela-circle-icon-theme: Recommended icon theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Orchis-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --shell new -d "$pkgdir/usr/share/themes"

  # Remove unnecessary files:
  rm -rf "$pkgdir"/usr/share/themes/{Orchis,Orchis-*}/gnome-shell/extensions

  # Plank theme
  install -Dm644 src/plank/dock.theme -t "$pkgdir/usr/share/plank/themes/Orchis"

  # Wallpapers
  install -Dm644 src/wallpaper/*.jpg -t \
    "$pkgdir/usr/share/backgrounds/orchis"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/firefox "$pkgdir/usr/share/doc/${pkgname%-git}"

  # Fix for Dash to panel
  cp -r src/gnome-shell/extensions/dash-to-panel "$pkgdir/usr/share/doc/${pkgname%-git}"
}
