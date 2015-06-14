# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>

pkgname=mbseventapi
_pkgname=eventapiV50
pkgver=45.2
_pkgver=45-2
pkgrel=3
pkgdesc="C functions to read/write events to/from GSI MBS"
url="http://www-win.gsi.de/lea/eventapi.htm"
arch=('i686' 'x86_64')
license=('unknown')
options=('staticlibs' '!emptydirs')

_srcname=MBSeventAPIv${_pkgver}
source=(http://www-linux.gsi.de/~mbs/download/$_srcname.tar.gz)
md5sums=('bf2df34158b4e853f8400763934f9df1')
build() {

  msg "Building the project"

  cd $srcdir/$_pkgname
  sed -i "s/rm/& -f/g" Makefile
  sed -i "s/COM = gcc -c -O/& -fPIC/g" Makefile
  make clean
  GSI_OS=Linux make -j1 || return 1
}

package() {

  msg "Installing the project"

  cd $srcdir/$_pkgname
  install -d $pkgdir/usr/include
  install -m644 *.h $pkgdir/usr/include

  install -d $pkgdir/usr/lib
  install -m644 *.a $pkgdir/usr/lib

  install -d $pkgdir/usr/bin
  find . -executable -type f -exec install -m755 {} $pkgdir/usr/bin \;

  msg "sgtty.h already own by glibc... removing from the package"
  rm $pkgdir/usr/include/sgtty.h
}
