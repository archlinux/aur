# Maintainer: Solomon Choina <shlomochoina@gmail.com>
_pkgbase=birb
pkgbase=birb-hg
pkgname=("$_pkgbase-hg" "$_pkgbase-docs-hg")
pkgver=60.0535be8c8e72
pkgrel=1
pkgdesc="GObject based library that implements a reusable plugin system"
arch=('i686' 'x86_64' 'armv7h')
url="https://keep.imfreedom.org/birb/birb/"
license=('GPL-2.0-or-later')
depends=('glib2')
makedepends=('mercurial' 'meson' 'help2man' 'vala' 'gi-docgen' 'gobject-introspection')
source=("hg+https://keep.imfreedom.org/birb/birb#branch=default")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"

  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
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

build() {
  arch-meson birb build
  ninja -C build
}

package_birb-hg() {
  depends+=()
  DESTDIR="$pkgdir" ninja -C build install
 cd $pkgdir
 _pick docs usr/share/doc
}

package_birb-docs-hg() {
  pkgdesc+=" (documentation)"
  depends=()
  mv docs/* "$pkgdir"


}
