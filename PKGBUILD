# Maintainer: Veli Tasalı <me@velitasali.com>

_pkgname=gtksourceview5
pkgname=$_pkgname-dev
_pkgbasename=gtksourceview
pkgver=5.0.0
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
url="https://wiki.gnome.org/Projects/GtkSourceView"
arch=('x86_64')
license=('LGPL2')
depends=('gtk4' 'libxml2' 'glib2' 'fribidi' 'pcre2')
makedepends=('intltool' 'gobject-introspection' 'glade' 'gtk-doc')
options=('!libtool')
conflicts=('gtksourceview5')
replaces=('gtksourceview5')
provides=(libgtksourceview-${pkgver%%.*}.so)
_commit=tags/$pkgver^0
source=("git+https://gitlab.gnome.org/GNOME/gtksourceview.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gtksourceview
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtksourceview
}

build() {
  arch-meson gtksourceview build -D glade_catalog=true -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
