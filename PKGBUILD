# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Claudio Sabattoli <gasherbrum3@alice.it>

pkgname=idesk
pkgver=0.7.5
pkgrel=8
pkgdesc="gives users of minimal wm's (fluxbox, blackbox, openbox, windowmaker...) icons on their desktop"
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/idesk/"
license=('GPL')
depends=('pkgconfig' 'imlib2' 'libpng' 'libxpm' 'libxft' 'gcc-libs')
source=("http://downloads.sourceforge.net/sourceforge/idesk/$pkgname-$pkgver.tar.bz2")
sha256sums=('d4b7ea5dcf6d49d83e2df9512d4c6388f11632a702b14f42a1bc6bffb617b3d3')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i \
    -e '1,1i#include <unistd.h>' \
    -e '1,1i#include <sys/stat.h>' \
    -e '1,1i#include <sys/types.h>' \
    src/DesktopConfig.cpp
  sed -i 's#usr/local#usr#' examples/default.lnk
  sed -i 's#IMLIB2_LIBS=.*#IMLIB2_LIBS=-lImlib2#g' configure
  sed -i 's#IMLIB_LIBS=.*#IMLIB_LIBS="-L/usr/lib -Wl,-O1,--sort-common,--as-needed,-z,relro -ljpeg -ltiff -lgif -lpng -lz -lm -lXext -lXext -lX11 -lImlib2"#g' configure
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
