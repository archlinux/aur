# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-reader
_gitname=guile-reader
pkgver=0.6.2
pkgrel=1
pkgdesc="a simple framework for building readers for GNU Guile"
url="http://www.nongnu.org/guile-reader"
arch=('i686' 'x86_64')
license=('GPL')
depends=('guile')
makedepends=('gperf' 'git')
source=("http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz" reader_flag.patch)
md5sums=('4491d6c601c151b48bcdb0b30c919a99'
         '577ee71c71dda2ac1fdd942dd18adc82')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < $srcdir/reader_flag.patch
}

build() {
  cd $pkgname-$pkgver
  # avoid autoreconf failure
  [[ -d  build-aux ]] || mkdir -p build-aux
  touch build-aux/config.rpath
  # recreate configure and make files
  autoreconf -i --force --verbose
  # configure
  CFLAGS= CPPFLAGS= LDFLAGS= GUILE_SITE=/usr/share/guile/site ./configure \
	--prefix=/usr --with-guilemoduledir=/usr/share/guile/site
  # compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/share/info/dir
}
