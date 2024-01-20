# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fluent-gtk-theme-git
pkgver=2023.06.20.r14.g9fdf52e
pkgrel=1
pkgdesc="Fluent design gtk theme for linux desktops"
arch=('any')
url="https://github.com/vinceliuice/Fluent-gtk-theme"
license=('GPL-3.0-or-later')
makedepends=('git' 'sassc' 'setconf')
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
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd wallpaper
  setconf install-gnome-backgrounds.sh BACKGROUND_DIR "$pkgdir/usr/share/backgrounds"
  setconf install-gnome-backgrounds.sh PROPERTIES_DIR "$pkgdir/usr/share/gnome-background-properties"
  setconf install-wallpapers.sh WALLPAPER_DIR "$pkgdir/usr/share/backgrounds"
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes"

  # Round version
  ./install.sh -t all --tweaks round float -d "$pkgdir/usr/share/themes"

  # Wallpapers
  cd "$srcdir/wallpaper"
  install -d "$pkgdir"/usr/share/{backgrounds,gnome-background-properties}
  ./install-gnome-backgrounds.sh
  ./install-wallpapers.sh
}
