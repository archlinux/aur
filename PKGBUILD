# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
pkgname=sosi2osm-git
_pkgname=sosi2osm
pkgver=2015.01.17.c8465d7
pkgrel=2
pkgdesc="SOSI to OSM conversion tool"
arch=('i686' 'x86_64')
url="https://www.github.com/Gnonthgol/sosi2osm"
license=('GPL3')
makedepends=('git' 'libfyba' 'proj')
depends=('libfyba' 'proj' 'lua')
provides=("${_pkgname}=${pkgver}")
source=("$pkgname::git+https://github.com/Gnonthgol/sosi2osm")
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
