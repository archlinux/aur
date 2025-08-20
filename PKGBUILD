# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>

pkgname=pcb2gcode-git
_pkgname=pcb2gcode
pkgver=r1805.07c6df4c
pkgrel=1
pkgdesc="Gerber to gcode file converter" 
arch=('i686' 'x86_64')
url="https://github.com/pcb2gcode/pcb2gcode"
license=('GPL')
makedepends=('git' 'boost')
depends=('gtkmm' 'boost-libs' 'gerbv-git' 'geos')
provides=('pcb2gcode')
conflicts=('pcb2gcode')
source=("$_pkgname"::'git+https://github.com/pcb2gcode/pcb2gcode.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  autoreconf -i
  ./configure --prefix=/usr

  # see https://github.com/pcb2gcode/pcb2gcode/issues/587#issuecomment-3122004254
  sed -i '/BOOST_CPPFLAGS_SYSTEM = $(subst -I,-isystem ,$(BOOST_CPPFLAGS))/d' Makefile
}

build() {
  cd "$srcdir/$_pkgname"
  make -j
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
