# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=librsvg-git
_pkgname=librsvg
pkgver=2.53.0.r12.gf95afedf
pkgrel=1
epoch=2
pkgdesc="SVG rendering library"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64 i686)
license=(LGPL)
depends=(gdk-pixbuf2 pango)
makedepends=(gobject-introspection vala git rust python-docutils gi-docgen)
provides=(librsvg-${pkgver%%.*}.so "${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed -r 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-static --enable-vala \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

check() {
  cd $pkgname
  # Test suite is very dependent on the versions of
  # Cairo, Pango, FreeType and HarfBuzz
  make check || :
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 et:
