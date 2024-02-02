# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Co-Maintainer: Solomon Choina <shlomochoina@gmail.com>
_pkgbase=gplugin
pkgbase="$_pkgbase-hg"
pkgname=("$_pkgbase-hg" "$_pkgbase-docs-hg")
pkgver=2003.b8f1ba3e24fc
pkgdesc="GObject based library that implements a reusable plugin system"
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url="https://keep.imfreedom.org/gplugin/gplugin/"
license=('LGPL-2.0-or-later')
makedepends=('mercurial' 'meson' 'gobject-introspection' 'gtk3' 'perl-glib-object-introspection'
             'python-gobject' 'lua-lgi' 'libxslt' 'help2man' 'vala' 'gi-docgen' 'gtk4')
provides=("$_pkgbase=0.0.23")
conflicts=("$_pkgbase")
source=("$_pkgbase::hg+https://keep.imfreedom.org/gplugin/gplugin#branch=default")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"

  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
  arch-meson gplugin build -Dgtk4=enabled
  meson compile -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_gplugin-hg() {
  depends=('glib2' 'gtk4' 'lua')
  optdepends=('gtk3: for GTK+ support'
            'python-gobject: for Python support'
            'lua53-lgi: for Lua support'
            'glib-perl: for perl support')

  DESTDIR="$pkgdir" ninja -C build install

  cd "$pkgdir"
  _pick docs usr/share/doc
}

package_gplugin-docs-hg() {
pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}
