# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=libjpeg7
pkgver=7
pkgrel=1
pkgdesc="Library of JPEG support functions, version 7"
arch=('i686' 'x86_64')
url="http://www.ijg.org/"
license=('custom')
depends=('glibc')
makedepends=('libtool')
options=(!libtool)
source=(http://www.ijg.org/files/jpegsrc.v7.tar.gz)
md5sums=('382ef33b339c299b56baf1296cda9785')

build() {
  cd "$srcdir/jpeg-$pkgver"
  ./configure --prefix=/usr --enable-shared --enable-static
  make
}

check(){
  cd "$srcdir/jpeg-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/jpeg-$pkgver"
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
  
  # See FS#11116 - re-assess need with v7 release sometime...
  install -m644 jpegint.h "$pkgdir/usr/include"

  install -Dm644 README "$pkgdir/usr/share/licenses/libjpeg7/README"
  # Fix /usr/bin
  for fn in "$pkgdir/usr/bin"/*; do mv $fn ${fn}7; done
  # Fix /usr/lib
  rm "$pkgdir/usr/lib/libjpeg".{a,so}
  # Fix /usr/share/man
  for fn in "$pkgdir/usr/share/man/man1"/*; do mv $fn ${fn%.1}7; done
  # Fix /usr/include
  mkdir -p "$pkgdir/usr/include/libjpeg7"
  mv "$pkgdir/usr/include"/*.h "$pkgdir/usr/include/libjpeg7"
}
