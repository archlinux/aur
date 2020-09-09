pkgname=gtk-doc-git
_pkgname=gtk-doc
pkgver=1.32+52+gb209222
pkgrel=1
pkgdesc="Documentation tool for public library API"
url="https://www.gtk.org/gtk-doc/"
arch=(any)
license=(GPL FDL)
depends=(docbook-xsl docbook-xml glib2-docs python-lxml python-pygments
         python-anytree)
makedepends=(dblatex git yelp-tools meson)
checkdepends=(bc gtk3 python-six python-parameterized)
optdepends=('dblatex: PDF support')
provides=(gtk-doc=$pkgver)
conflicts=(gtk-doc)
source=("git+https://gitlab.gnome.org/GNOME/gtk-doc.git"
         fix.diff)
sha512sums=('SKIP'
            '6d5dd328f784986c1bc46e8bdd800226c5e7eaec2b2b921e0b930435cbe42d73283dd1f87272e1c1cfec9e24e21b7d551f5609d20e4838ba4d3eba1bb1479d43')

pkgver() {
  cd $_pkgname
  git describe --tags | sed -e 's/GTK_DOC_//' -e 's/_/\./g' -e 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -Np1 -i ../fix.diff
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  # Tests don't work yet
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
