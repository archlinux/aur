# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgbase=hasl-hg
pkgname=(hasl-hg hasl-docs-hg)
pkgver=r88.21a44641a9c2
pkgrel=1
pkgdesc="The Hassle-free Authentication and Security Layer client library"
arch=("x86_64")
url="https://keep.imfreedom.org/hasl/hasl/"
license=('LGPL-2.1-or-later')
depends=(glib2 glibc libidn)
makedepends=(meson ninja mercurial gi-docgen gobject-introspection)
provides=('hasl')
source=("hg+https://keep.imfreedom.org/hasl/hasl")
sha256sums=('SKIP')
pkgver() {
	cd hasl
        printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

}

build() {
        arch-meson hasl build
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

package_hasl-hg() {
  provides=(hasl)
  conflicts=(hasl)
  DESTDIR="$pkgdir/" ninja -C build install

  cd "$pkgdir"

   _pick docs usr/share/doc
}

package_hasl-docs-hg() {
   pkdesc+="  (documentation)"
   depends=()
   provides=(hasl-docs)
   mv docs/* "$pkgdir"
 }

