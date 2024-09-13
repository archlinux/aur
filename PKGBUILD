# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=adw-gtk-theme-git
_pkgname=adw-gtk3
pkgver=5.3.r13.g91aac01
pkgrel=1
pkgdesc="The theme from libadwaita ported to GTK-3"
arch=('any')
url="https://github.com/lassekongo83/adw-gtk3"
license=('LGPL-2.1-or-later')
makedepends=('git' 'meson' 'sassc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${_pkgname}")
_adw_tag=1.6.0
source=("git+https://github.com/lassekongo83/adw-gtk3.git"
        "git+https://gitlab.gnome.org/GNOME/libadwaita.git#tag=${_adw_tag}")
sha256sums=('SKIP'
            '0f7eaf661fc3a7976207726eecf93c93c79744ff8428e322a16b55f12a4ee22d')

pkgver() {
  cd "${_pkgname}"
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
  cp libadwaita/src/stylesheet/libadwaita.css "${_pkgname}/gtk/src/${_pkgname}/gtk-3.0/libadwaita.css"
  cp libadwaita/src/stylesheet/gtk.css "${_pkgname}/gtk/src/${_pkgname}/gtk-4.0/gtk.css"
  cp libadwaita/src/stylesheet/gtk-dark.css "${_pkgname}/gtk/src/${_pkgname}/gtk-4.0/gtk-dark.css"
  cp libadwaita/src/stylesheet/gtk-dark.css "${_pkgname}/gtk/src/${_pkgname}-dark/gtk-4.0/gtk.css"
  cp libadwaita/src/stylesheet/gtk-dark.css "${_pkgname}/gtk/src/${_pkgname}-dark/gtk-4.0/gtk-dark.css"

  # Add libadwaita to the gtk.css files
  pushd "${_pkgname}"
  echo "@import '../gtk-3.0/libadwaita.css';" >> ./"gtk/src/${_pkgname}/gtk-4.0/gtk.css"
  echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> ./"gtk/src/${_pkgname}/gtk-4.0/gtk.css"
  echo "@import '../gtk-3.0/libadwaita.css';" >> ./"gtk/src/${_pkgname}/gtk-4.0/gtk-dark.css"
  echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> ./"gtk/src/${_pkgname}/gtk-4.0/gtk-dark.css"
  echo "@import '../gtk-3.0/libadwaita.css';" >> ./"gtk/src/${_pkgname}-dark/gtk-4.0/gtk.css"
  echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> ./"gtk/src/${_pkgname}-dark/gtk-4.0/gtk.css"
  echo "@import '../gtk-3.0/libadwaita.css';" >> ./gtk/src/"${_pkgname}-dark/gtk-4.0/gtk-dark.css"
  echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> ./"gtk/src/${_pkgname}-dark/gtk-4.0/gtk-dark.css"
  popd

  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
