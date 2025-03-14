# Maintainer: Solomon Choina <shlomochoina@gmail.com>
_pkgbase=xeme
pkgbase=xeme-hg
pkgname=("$_pkgbase-hg" "$_pkgbase-docs-hg")
pkgver=63.fe3187889638
pkgrel=1
pkgdesc="A high level XMPP parsing library based on GObjects."
arch=('i686' 'x86_64' 'armv7h')
url="https://keep.imfreedom.org/xeme/xeme/"
license=('LGPL-2.1-or-later')
depends=('glib2')
makedepends=('mercurial' 'meson' 'help2man' 'vala' 'gi-docgen' 'gobject-introspection' 'birb-hg')
source=("hg+https://keep.imfreedom.org/xeme/xeme#branch=default")
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
  arch-meson xeme build
  ninja -C build
}

package_xeme-hg() {
  depends+=(birb-hg)
  provides=(xeme)
  DESTDIR="$pkgdir" ninja -C build install
 cd $pkgdir
 _pick docs usr/share/doc
}

package_xeme-docs-hg() {
  pkgdesc+=" (documentation)"
  provides=(xeme-docs)
  depends=()
  mv docs/* "$pkgdir"


}
