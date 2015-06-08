# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
#
# Man file, patches and autoreconf are from ebuild and rpm

pkgname=libptp2
pkgver=1.1.10
pkgrel=5
pkgdesc="Library to communicate with PTP devices like cameras or MP3 players"
arch=('i686' 'x86_64')
url="http://libptp.sourceforge.net/"
license=('GPL')
depends=('libusb')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/libptp/$pkgname-$pkgver.tar.gz
        ptpcam.1.man)
md5sums=('5a0e2965d1077c316d6ae6a8cef96238'
         'ecdd0fb2c06bdc141a60494b3ecb888e')

prepare() {
  sed -e 's/VERSION//g' ptpcam.1.man > ptpcam.1

  cd $pkgname-$pkgver
  sed -i 's/^ptpcam_LDADD = -lptp2 /ptpcam_LDADD = libptp2.la /' src/Makefile.am
  sed -i '/^ptpcam_DEPENDANCIES/d' src/Makefile.am
  echo "ACLOCAL_AMFLAGS=-I m4" >> Makefile.am
  echo -e "\nAM_PROG_CC_C_O" >> configure.in
}

build() {
  cd $pkgname-$pkgver
  autoreconf -fi -I m4
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  install -Dm644 ptpcam.1 "$pkgdir/usr/share/man/man1/ptpcam.1"

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

