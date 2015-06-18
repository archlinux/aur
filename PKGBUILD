# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=tapeutape
pkgver=0.1.1
pkgrel=6
pkgdesc="MIDI controllable sampler"
arch=('i686' 'x86_64')
url="http://hitmuri.net/index.php/software/tapeutape"
license=('GPL')
depends=('fltk' 'lash')
makedepends=('scons')
source=(http://www.hitmuri.net/uploads/Software/$pkgname-$pkgver.tar.gz sconstruct_tapeutape.diff)
md5sums=('ac1168e2b93a2ae1a18d583f904c9dd1'
         '6fa7653d512dc4074dd15615eeccbc25')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # patch SConstruct to allow for DESTDIR & PREFIX
  patch -i "$srcdir/sconstruct_tapeutape.diff" SConstruct

  # don't use non-existent static fltk libs
  sed -i 's/fltk-config --libs --cxxflags --ldflags/fltk-config --cxxflags --ldflags/' SConstruct

  # fix bug exposed by gcc 4.7 (undeclared getcwd)
  sed -i 's/#include "sample.h"/&\n#include <unistd.h>/' src/audio/sample.cpp

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
