# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=tranches
pkgver=0.1.1
pkgrel=5
pkgdesc="MIDI controllable beat slicer"
arch=('i686' 'x86_64')
url="http://hitmuri.net/index.php/software/tranches"
license=('GPL')
depends=('fltk' 'lash')
makedepends=('scons')
source=(http://www.hitmuri.net/uploads/Software/$pkgname-$pkgver.tar.gz sconstruct_tranches.diff)
md5sums=('16e50166309caee1ea94ea944812dbb9'
         '8ad5ef73d1925dfa17733cfa647dd9cb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # patch SConstruct to allow for DESTDIR & PREFIX
  patch -i "$srcdir/sconstruct_tranches.diff" SConstruct

  # don't use non-existent static fltk libs
  sed -i 's/fltk-config --libs --cxxflags --ldflags/fltk-config --cxxflags --ldflags/' SConstruct

  # remove object files
  rm src/*/*.o
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  scons
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  scons DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
