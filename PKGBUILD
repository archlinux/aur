# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tse3
pkgver=0.3.1
pkgrel=8
pkgdesc="A powerful open source sequencer engine written in C++."
arch=('i686' 'x86_64')
depends=('alsa-lib' 'gcc-libs')
makedepends=()
options=('!libtool' '!makeflags')
url="http://tse3.sourceforge.net/"
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz \
	tse3-0.2.7-gcc4.patch \
	tse3-0.2.7-size_t-64bit.patch \
	tse3_autoconf.patch)
md5sums=('3b7e35505160e2d761e5b43abb636f3c'
         '8e4852bb1d17c8921b3599712fda8484'
         '71287d128bdfd588b7c22645025e4b31'
         'd8ecd3b6701b3d761444b0200d296219')

prepare () {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/tse3-0.2.7-gcc4.patch"
  [ "$CARCH" = "x86_64" ] && \
    patch -Np0 -i "$srcdir/tse3-0.2.7-size_t-64bit.patch"
  patch -Np1 -i "$srcdir"/tse3_autoconf.patch
}  
  
build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf --force --install --symlink
  ./configure --prefix=/usr --with-alsa --without-oss 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d $pkgdir/usr/doc/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install  
  install -d $pkgdir/usr/share/doc/$pkgname
  cd doc
  for _i in *.html 
  do
    install -Dm644 ${_i} $pkgdir/usr/share/doc/$pkgname/${_i}
  done 
  rm -r $pkgdir/usr/doc
}
