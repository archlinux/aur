# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sxemacs
pkgver=22.1.17
pkgrel=2
pkgdesc="A derivation of xemacs - stable version"
arch=('i686' 'x86_64')
url="http://www.sxemacs.org/"
license=('GPL')
depends=('libao' 'gpm' 'libtiff' 'jack' 'libmad' 'desktop-file-utils' 
	 'compface' 'libpulse' 'libxaw' 'sox' 'openssl' 'ffmpeg' 'xaw3d'
	 'postgresql-libs')
# dependancy postgresql-libs can be avoided using --with-postgres=no in configure statement
makedepends=('texinfo' 'xbitmaps')
conflicts=('xemacs')
source=(https://downloads.sxemacs.org/releases/sxemacs-22.1.17.tar.lzma)
md5sums=('b948990a661915c9b49195a32c18e7b6')

prepare() {
  
  [ -d $pkgname-$pkgver/libltdl/m4 ] || mkdir -p $pkgname-$pkgver/libltdl/m4
  [ -d build ] || mkdir -p build
}

build() {
  cd build

  CFLAGS="$CFLAGS -I/usr/include/freetype2 -fcommon" \
      ../$pkgname-$pkgver/configure --prefix=/usr --with-openssl --with-athena=3d
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
# remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.sxemacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1,ctags.sxemacs.1}
# remove conflict with other emacsen
  mv "$pkgdir"/usr/bin/{etags,etags.sxemacs}
  mv "$pkgdir"/usr/share/man/man1/{etags.1,etags.sxemacs.1}
  mv "$pkgdir"/usr/share/info/cl.info \
    "$pkgdir"/usr/share/info/cl-sxemacs.info
  mv "$pkgdir"/usr/share/info/widget.info \
    "$pkgdir"/usr/share/info/widget-sxemacs.info
}
