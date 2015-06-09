# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
pkgname=sosi2osm-git
pkgver=2015.01.17.c8465d7
pkgrel=1
pkgdesc="SOSI to OSM conversion tool"
arch=('i686' 'x86_64')
url="https://www.github.com/Gnonthgol/sosi2osm"
license=('GPL3')
makedepends=('git' 'libfyba' 'proj')
depends=('libfyba' 'proj' 'lua')
source=("$pkgname::git://github.com/Gnonthgol/sosi2osm")
md5sums=('SKIP')
CPPFLAGS='-I/usr/include/fyba'

pkgver() {
  cd "$pkgname"
  git log -1 --format="%cd.%h" --date=short | sed 's:-:.:g'
}

prepare() {
  sed -e 's|lua5.1-c++|lua|' \
      -e '/^OBJFILES/a DESTDIR=\/' \
      -e 's|/usr/local/|$(DESTDIR)usr/|' \
      -e 's|install -m|install -Dm|' \
      -e 's|\(\t.*install.* sosi2osm .*$\)|\1/sosi2osm|' \
      -i "$srcdir/$pkgname/Makefile"
}

build() {
  cd "$pkgname"
  make
} 

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
