# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname=tepl
pkgname="${_pkgname}-git"
pkgver=6.5.1+2+ga58b1fb
pkgrel=1
_pkgdesc=("Library that eases the development of GtkSourceView-based "
         "text editors and IDEs")
pkgdesc="${_pkgdesc[@]}"
arch=(x86_64)
url="https://gitlab.gnome.org/swilmet/${_pkgname}"
license=(LGPL2.1)
depends=(
  'amtk'
  'cairo'
  'glib2'
  'glibc'
  'gsettings-desktop-schemas'
  'gtk3'
  'gtksourceview4'
  'icu'
  'pango'
)
makedepends=(
  'git'
  'gobject-introspection'
  'gtk-doc'
  'meson'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
