# Maintainer: David Adler <d dot adler at posteo dot de>
pkgname=tapeutape
pkgver=0.1.1
pkgrel=8
pkgdesc="MIDI controllable sampler"
arch=('x86_64')
url="http://hitmuri.net/index.php/software/tapeutape"
license=('GPL')
depends=('fltk' 'jack')
makedepends=('scons')
source=(http://www.hitmuri.net/uploads/Software/$pkgname-$pkgver.tar.gz sconstruct_tapeutape.diff)
md5sums=('ac1168e2b93a2ae1a18d583f904c9dd1'
         '5f3d5f95cf666c5d1144da1887fd4362')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # patch SConstruct
  patch -i "$srcdir/sconstruct_tapeutape.diff" SConstruct

  # fix bug exposed by gcc 4.7 (undeclared getcwd)
  sed -i 's/#include "sample.h"/&\n#include <unistd.h>/' src/audio/sample.cpp

  # remove object files
  rm src/*/*.o
}

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  scons lash=0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  scons DESTDIR="$pkgdir" PREFIX=/usr install
}

