# Maintainer: Darryl Pogue <darryl@dpogue.ca>

pkgbase=gplugin
_pkgname=gplugin
pkgname=(gplugin gplugin-docs)
pkgver=0.44.2
pkgrel=3
arch=('i868' 'x86_64')
license=("LGPL2")
url="https://keep.imfreedom.org/gplugin/gplugin"
pkgdesc="A GObject based library that implements a reusable plugin system"
depends=("gtk3" "gtk4" "glib-perl" "lua" "python")
makedepends=("meson"
             "mercurial"
             "gcc"
             "gobject-introspection"
             "pkg-config"
             "help2man"
             "gettext"
             "gi-docgen"
             "lua-lgi"
             "perl-glib-object-introspection"
             "python-gobject"
             "vala")
options=('strip' '!debug' 'staticlibs')
source=("$pkgname::hg+https://keep.imfreedom.org/$_pkgname/$_pkgname/#tag=v$pkgver")
sha256sums=('SKIP')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv -v "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  arch-meson gplugin build
  ninja -C build
}

package_gplugin() {
  depends=("gtk3" "gtk4" "glib-perl" "lua" "python")
  DESTDIR="$pkgdir" ninja -C build install

  cd "$pkgdir"
  _pick docs usr/share/doc/gplugin*
}


package_gplugin-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv docs/* "$pkgdir"
}
