pkgbase=gobject-introspection-git
_pkgname=gobject-introspection
pkgname=(gobject-introspection-git gobject-introspection-runtime-git)
pkgver=1.64.0+75+g8b0a7f4c
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64)
license=(LGPL GPL)
depends=(python-mako python-markdown)
makedepends=(cairo git gtk-doc python-sphinx meson glib2)
provides=(gobject-introspection=$pkgver)
conflicts=(gobject-introspection)
options=(!emptydirs)
source=("git+https://gitlab.gnome.org/GNOME/gobject-introspection.git"
        "git+https://gitlab.gnome.org/GNOME/glib.git")
sha512sums=('SKIP'
            'SKIP')
validpgpkeys=('923B7025EE03C1C59F42684CF0942E894B2EAFA0') # Philip Withnall <philip@tecnocode.co.uk>

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}
  
build() {
  arch-meson $_pkgname build \
    -D gtk_doc=true \
    -D glib_src_dir="$srcdir/glib"
  ninja -C build
}

check() {
  meson test -C build
}

package_gobject-introspection-git() {
  depends+=("gobject-introspection-runtime")

  DESTDIR="$pkgdir" meson install -C build

  python -m compileall -d /usr/lib/$_pkgname "$pkgdir/usr/lib/$_pkgname"
  python -O -m compileall -d /usr/lib/$_pkgname "$pkgdir/usr/lib/$_pkgname"

### Split runtime
  mkdir -p "$srcdir/runtime/lib"
  mv "$pkgdir"/usr/lib/{lib*,girepository-*} "$srcdir/runtime/lib"
}

package_gobject-introspection-runtime-git() {
  pkgdesc+=" (runtime library)"
  depends=(glib2)
  provides=(gobject-introspection-runtime=$pkgver libgirepository-1.0.so)
  conflicts=(gobject-introspection-runtime)

  mv "$srcdir/runtime" "$pkgdir/usr"
}
