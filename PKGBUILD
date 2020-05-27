# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: <arsenm2@rpi.edu>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

_pkgname=gobject-introspection
pkgbase="${_pkgname}-git"
pkgname=(${_pkgname}-git ${_pkgname}-runtime-git)
pkgver=1.64.0+47+ge7c17469
pkgrel=1
epoch=1
pkgdesc="Introspection system for GObject-based libraries (Git)"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=('x86_64' 'i686')
license=('LGPL' 'GPL')
depends=(python-mako python-markdown)
_glibver=2.64.1
makedepends=(cairo git gtk-doc python-sphinx meson)
provides=("gobject-introspection=${pkgver}" "gobject-introspection-runtime=${pkgver}")
conflicts=('gobject-introspection' 'gobject-introspection-svn' "gobject-introspection-runtime")
replaces=('gobject-introspection-svn' 'gobject-introspection')
options=(!emptydirs)
source=("git+https://gitlab.gnome.org/GNOME/gobject-introspection.git"
        "git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$_glibver")
sha512sums=('SKIP'
            'SKIP')
validpgpkeys=('923B7025EE03C1C59F42684CF0942E894B2EAFA0') # Philip Withnall <philip@tecnocode.co.uk>


pkgver() {
  cd $srcdir/$_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$srcdir/$_pkgname"
  arch-meson $_pkgname build \
    -D gtk_doc=true \
    -D glib_src_dir="$srcdir/glib"
  ninja -C build
}

check() {
  meson test -C build
}

package_gobject-introspection-git() {
  depends+=("gobject-introspection-runtime-git=$pkgver-$pkgrel")

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
  provides+=(libgirepository-1.0.so)

  mv "$srcdir/runtime" "$pkgdir/usr"
}
