# Maintainer: Sven Schwermer <aur@svenschwermer.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>
# Contributor: Tim Besard <tim.besard@gmail.com>

pkgname=avr-libc-avrxmega3-svn
_pkgname=avr-libc
pkgver=r2550M
pkgrel=1
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
'avrxmega3-v10.diff.xz'::'https://file.savannah.nongnu.org/file/avrxmega3-v10.diff.xz?file_id=48974')
md5sums=('SKIP' '12ca80af092e6b138356287b69f40d2a')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo r$(svnversion)
}

prepare() {
  cd "$srcdir/$_pkgname"

  # https://savannah.nongnu.org/patch/?9543
  xzcat "$srcdir/avrxmega3-v10.diff.xz" | patch -p0
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
