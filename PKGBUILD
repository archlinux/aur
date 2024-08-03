# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=adw-gtk3-git
pkgver=5.3.r8.gd88deed
pkgrel=2
pkgdesc="The theme from libadwaita ported to GTK-3"
arch=('any')
url="https://github.com/lassekongo83/adw-gtk3"
license=('LGPL-2.1-or-later')
makedepends=('git' 'meson' 'sassc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_adw_tag=1.5.3
source=("git+https://github.com/lassekongo83/adw-gtk3.git"
        "git+https://gitlab.gnome.org/GNOME/libadwaita.git#tag=${_adw_tag}")
sha256sums=('SKIP'
            '569662f8b36afe62d1bfc53b3abf908bede1d33c6f0586a1973b6eb46604261a')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  # Update GTK4 theme: .github/workflows/update-gtk4-theme.yml

  # Compile scss
  pushd libadwaita/src/stylesheet
  sassc -a -M -t compact base.scss libadwaita.css
  sassc -a -M -t compact defaults-light.scss gtk.css
  sassc -a -M -t compact defaults-dark.scss gtk-dark.css
  popd

  # Copy css files
  cp libadwaita/src/stylesheet/libadwaita.css "${pkgname%-git}/gtk/src/${pkgname%-git}/gtk-3.0/libadwaita.css"
  cp libadwaita/src/stylesheet/gtk.css "${pkgname%-git}/gtk/src/${pkgname%-git}/gtk-4.0/gtk.css"
  cp libadwaita/src/stylesheet/gtk-dark.css "${pkgname%-git}/gtk/src/${pkgname%-git}/gtk-4.0/gtk-dark.css"
  cp libadwaita/src/stylesheet/gtk-dark.css "${pkgname%-git}/gtk/src/${pkgname%-git}-dark/gtk-4.0/gtk.css"
  cp libadwaita/src/stylesheet/gtk-dark.css "${pkgname%-git}/gtk/src/${pkgname%-git}-dark/gtk-4.0/gtk-dark.css"

  # Add libadwaita to the gtk.css files
  pushd "${pkgname%-git}"
  echo "@import '../gtk-3.0/libadwaita.css';" >> ./"gtk/src/${pkgname%-git}/gtk-4.0/gtk.css"
  echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> ./"gtk/src/${pkgname%-git}/gtk-4.0/gtk.css"
  echo "@import '../gtk-3.0/libadwaita.css';" >> ./"gtk/src/${pkgname%-git}/gtk-4.0/gtk-dark.css"
  echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> ./"gtk/src/${pkgname%-git}/gtk-4.0/gtk-dark.css"
  echo "@import '../gtk-3.0/libadwaita.css';" >> ./"gtk/src/${pkgname%-git}-dark/gtk-4.0/gtk.css"
  echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> ./"gtk/src/${pkgname%-git}-dark/gtk-4.0/gtk.css"
  echo "@import '../gtk-3.0/libadwaita.css';" >> ./gtk/src/"${pkgname%-git}-dark/gtk-4.0/gtk-dark.css"
  echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> ./"gtk/src/${pkgname%-git}-dark/gtk-4.0/gtk-dark.css"
  popd

  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
