# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
#
# Man file, patches and autoreconf are from ebuild and rpm

pkgname=libptp2
pkgver=1.2.0
pkgrel=2
pkgdesc="Library to communicate with PTP devices like cameras or MP3 players"
arch=('x86_64')
url="http://libptp.sourceforge.net/"
license=('GPL')
depends=('libusb-compat')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/libptp/$pkgname-$pkgver.tar.gz
        ptpcam.1.man)
md5sums=('c96bfae78414afb83b61ddbfc7e2cb75'
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
  install -dm755 "$pkgdir/usr/share/man/man1"
  install -Dm644 ptpcam.1 "$pkgdir/usr/share/man/man1/ptpcam.1"

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

