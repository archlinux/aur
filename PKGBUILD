# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Claudio Sabattoli <gasherbrum3@alice.it>
# Contributor: Ole Ernst <olebowle@gmx.com>

pkgname=idesk
pkgver=0.7.5
pkgrel=10
pkgdesc="gives users of minimal wm's (fluxbox, blackbox, openbox, windowmaker...) icons on their desktop"
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/idesk/"
license=('GPL')
depends=('pkgconfig' 'imlib2' 'libpng' 'libxpm' 'libxft' 'gcc-libs')
source=("http://downloads.sourceforge.net/sourceforge/idesk/$pkgname-$pkgver.tar.bz2"
	imlib2-config.patch)
sha256sums=('d4b7ea5dcf6d49d83e2df9512d4c6388f11632a702b14f42a1bc6bffb617b3d3'
            'a610f7be40e4540f8f557f739f44664cd773b060282d8c7051efde457a979e92')

prepare() {
  cd $pkgname-$pkgver
  sed -i \
    -e '1,1i#include <unistd.h>' \
    -e '1,1i#include <sys/stat.h>' \
    -e '1,1i#include <sys/types.h>' \
    src/DesktopConfig.cpp
  sed -i 's/return iconConfigList\[++iterCtr\];/return ++iterCtr < iconConfigList.size() ? iconConfigList\[iterCtr\] : NULL;/' src/AbstractClasses.h
  sed -i 's#usr/local#usr#' examples/default.lnk
  patch -Np2 -b -z .orig <../imlib2-config.patch
  autoreconf -fiv
  sed -i \
    -e 's#IMLIB2_LIBS=.*#IMLIB2_LIBS=-lImlib2#g' \
    -e 's#IMLIB_LIBS=.*#IMLIB_LIBS="-L/usr/lib -Wl,-O1,--sort-common,--as-needed,-z,relro -ljpeg -ltiff -lgif -lpng -lz -lm -lXext -lXext -lX11 -lImlib2"#g' \
    configure
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
