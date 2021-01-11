# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=librsvg-minimal-git
pkgver=2.50.2
pkgrel=1
pkgdesc="SVG rendering library"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64)
license=(LGPL)
depends=(gdk-pixbuf2 pango)
makedepends=(gobject-introspection vala git rust)
provides=(librsvg-${pkgver%%.*}.so librsvg)
conflicts=(librsvg)
source=("git+https://gitlab.gnome.org/GNOME/librsvg.git"
        lto.diff)
sha256sums=('SKIP'
            '3cc8ad1af515b2cb4071f0647319c1cf3280dc054875634239061800af1616b6')

pkgver() {
  cd librsvg
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd librsvg

  # Turn LTO back on
  git apply -3 ../lto.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd librsvg
  ./configure --prefix=/usr --disable-static --enable-vala --disable-pixbuf-loader --disable-debug \
    --disable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

#check() {
#  cd librsvg
  # Test suite is very dependent on the versions of
  # Cairo, Pango, FreeType and HarfBuzz
#  make check || :
#}

package() {
  cd librsvg
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
