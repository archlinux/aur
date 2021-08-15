# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=fluent-gtk-theme-git
pkgver=2021.08.08.r23.ge97f950
pkgrel=1
pkgdesc="Fluent design gtk theme for linux desktops"
arch=('any')
url="https://www.pling.com/p/1477941"
license=('GP3')
depends=('gnome-themes-extra' 'gtk3')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'fluent-icon-theme: Matching icon theme'
            'fluent-cursor-theme: Matching cursor theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Fluent-gtk-theme.git"
        'wallpaper::git+https://github.com/vinceliuice/Fluent-gtk-theme.git#branch=Wallpaper')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes"

  # Remove unnecessary files:
  rm -rf "$pkgdir"/usr/share/themes/{Fluent,Fluent-*}/gnome-shell/extensions

  # Plank theme
  install -Dm644 src/plank/dock.theme -t "$pkgdir/usr/share/plank/themes/Fluent"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/firefox "$pkgdir/usr/share/doc/${pkgname%-git}"

  # Dash to dock theme
  cp -r src/dash-to-dock "$pkgdir/usr/share/doc/${pkgname%-git}"

  # Fix for Dash to panel & Workspaces to Dock
  cp -r src/gnome-shell/extensions/* "$pkgdir/usr/share/doc/${pkgname%-git}"

  # Wallpapers
  cd "$srcdir/wallpaper"
  install -d "$pkgdir"/usr/share/{backgrounds,gnome-background-properties}
  ./install-gnome-backgrounds.sh
}
