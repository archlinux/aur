# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whitesur-gtk-theme-git
pkgver=2021.07.27.r0.gc790fa2
pkgrel=1
pkgdesc="MacOS Big Sur like theme for GNOME desktops"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-gtk-theme"
license=('GPL')
makedepends=('git' 'sassc' 'setconf')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'whitesur-icon-theme-git: matching icon theme'
            'whitesur-cursor-theme-git: matching cursor theme'
            'whitesur-kvantum-theme: matching Kvantum theme'
            'plank: for included plank theme'
            'gnome-shell-extension-dash-to-dock: recommended GNOME extension'
            'gnome-shell-extension-blur-my-shell: recommended GNOME extension')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/WhiteSur-gtk-theme.git"
        'wallpapers::git+https://github.com/vinceliuice/WhiteSur-gtk-theme.git#branch=wallpapers')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/wallpapers"
  setconf install-gnome-backgrounds.sh BACKGROUND_DIR "$pkgdir/usr/share/backgrounds"
  setconf install-gnome-backgrounds.sh PROPERTIES_DIR "$pkgdir/usr/share/gnome-background-properties"
  setconf install-wallpapers.sh WALLPAPER_DIR "$pkgdir/usr/share/backgrounds"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/themes"

  # See for more customization options:
  # https://github.com/vinceliuice/WhiteSur-gtk-theme#theres-so-many-customizations-you-can-do
  ./install.sh \
    --alt all \
    --theme all \
    --dest "$pkgdir/usr/share/themes"

  install -Dm644 src/other/plank/theme-dark/* -t \
    "$pkgdir/usr/share/plank/themes/WhiteSur-dark"
  install -Dm644 src/other/plank/theme-light/* -t \
    "$pkgdir/usr/share/plank/themes/WhiteSur-light"
  install -d "$pkgdir/usr/share/docs/$pkgname"
  cp -r src/other/{dash-to-dock,firefox} "$pkgdir/usr/share/docs/$pkgname"

  cd "$srcdir/wallpapers"
  install -d "$pkgdir"/usr/share/{backgrounds,gnome-background-properties}
  ./install-gnome-backgrounds.sh
  ./install-wallpapers.sh
}
