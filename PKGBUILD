# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>
# Contributor: James Morris <james@jwm-art.net>

pkgname=subtitleripper
pkgver=0.5.2
pkgrel=2
pkgdesc="DVD subtitle to text converter"
arch=('x86_64')
url="http://subtitleripper.sourceforge.net/"
license=('GPL')
depends=('netpbm')
makedepends=('make' 'gcc' 'netpbm')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('2ae166123a8d46a0be7eba552ef33d84ab09ba9a882f1b684c85bf442f8ddc35')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # use netpbm instead of libppm or whatever it was
  sed -i 's/_HAVE_LIB_PPM_/_HAVE_NETPBM_/g' *
  sed -i 's|<ppm.h>|<netpbm/ppm.h>|g' *.[ch]
  sed -i 's/-lppm/-lnetpbm/' Makefile
  # quieten warnings about exit():
  sed -i '1s/^/#include <stdlib.h>/' subtitle2pgm.c
  # force use of getline to prevent aborted build:
  sed -i 's/DEFINES :=/DEFINES := -DHAVE_GETLINE/' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"

  install -D -m755 {pgm2txt,srttool,subtitle2pgm,subtitle2vobsub,subtitleripper,vobsub2pgm} "$pkgdir/usr/bin"
}

