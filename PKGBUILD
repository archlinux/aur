# Maintainer: EndlessEden <eden.rose@deep-rose.org>
#
# Original Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
# Maintainer: Solaraquarion <shlomochoina@gmail.com>
_pkgname=talkatu
pkgbase=$_pkgname-hg
pkgname=("$_pkgname"-hg "$_pkgname"-docs-hg )

pkgver=1.0.r509.42ce88fc5ee3
pkgrel=1
pkgdesc="Gtk+ widgets for chat software"
arch=('i686' 'x86_64')
url="https://keep.imfreedom.org/talkatu/talkatu"
license=('GPL-2.0-or-later')
makedepends=('mercurial' 'meson' 'vala' 'help2man' 'gtk-doc' 'gobject-introspection' 'gtk4' 'gi-docgen' 'gumbo-parser' 'cmark')
source=("hg+https://keep.imfreedom.org/$_pkgname/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd talkatu
  printf "1.0.r%s.%s" \
    "$(hg identify -n)" \
    "$(hg identify -i)"
}

build() {
  arch-meson build talkatu -Dtests=false
  ninja -C build
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


package_talkatu-hg() {
  depends=('gtk4' 'gumbo-parser>=0.10' 'cmark')
  DESTDIR="${pkgdir}" ninja -C build install
  cd ${pkgdir}/usr/include
  ln -s talkatu-1.0 talkatu

  cd "$pkgdir"
  _pick docs usr/share/doc
}

package_talkatu-docs-hg() {
   pkgdesc+=" (documentation)"
   depends=()

   mv docs/* "$pkgdir"
}
