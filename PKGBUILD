# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
pkgname=arpage
pkgver=0.3.3
pkgrel=7
pkgdesc="JACK MIDI arpeggiator with transport and tempo sync"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/arpage/"
license=('GPL')
depends=('jack' 'gtkmm' 'libxml++')
makedepends=('intltool')
source=(http://downloads.sourceforge.net/project/arpage/Alpha%20Release%20$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('987070a6efb4c9e9f3dbe4ca43ddc6a4')

build() {
  cd $srcdir/$pkgname-$pkgver

  # fix for gcc >= 4.6 (undeclared NULL)
  sed -i 's/#include <vector>/&\n#include <cstddef>/' -i src/scales.h
	
  # fix for gcc 4.7  (undeclared sleep)
  sed -i 's/#include <cstdio>/&\n#include <unistd.h>/' src/jack_process.cc

  # fix XML syntax
  sed -i "s_\(arpeggiator\)/_/\1_" -i src/arpstorage.cc

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
