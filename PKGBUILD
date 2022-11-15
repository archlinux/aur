# Maintainer: Sven Schwermer <aur@svenschwermer.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>
# Contributor: Tim Besard <tim.besard@gmail.com>

pkgname=avr-libc-avrxmega3-svn
_pkgname=avr-libc
pkgver=r2557M
pkgrel=2
pkgdesc="The C runtime library for the AVR family of microcontrollers (incl. avrxmega3 devices)"
arch=('any')
url="http://savannah.nongnu.org/projects/avr-libc/"
license=('BSD')
depends=('avr-gcc')
makedepends=('svn' 'xz')
provides=('avr-libc')
conflicts=('avr-libc')
options=('!strip' 'libtool' 'staticlibs')
source=("$_pkgname"::'svn+http://svn.savannah.nongnu.org/svn/avr-libc/trunk/avr-libc/'
'avrxmega3-v12.diff.xz'::'https://file.savannah.nongnu.org/file/avrxmega3-v12.diff.xz?file_id=52334')
md5sums=('SKIP' '382ff8c9af985afe0f489475ae3390b4')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo r$(svnversion)
}

prepare() {
  cd "$srcdir/$_pkgname"

  # https://savannah.nongnu.org/patch/?9543
  xzcat "$srcdir/avrxmega3-v12.diff.xz" | patch -p0
}

build() {
  cd "$srcdir/$_pkgname"

  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  ./bootstrap
  ./configure --build=$(./config.guess) --host=avr --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}

# vim:set ts=2 sw=2 et:
