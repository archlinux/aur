# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=prerex  
pkgver=6.5.4
_vver=6.4.3
pkgrel=1
pkgdesc="a LaTeX document style for prerequisite charts"
url="http://www.prerex.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libedit' 'poppler-qt')
install=prerex.install
source=("http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/doc/$pkgname-$pkgver.tar.gz"
	"http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/doc/v$pkgname-${_vver}.tar.gz"
	"http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/$pkgname.sty"
	http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/prerex/doc/prerex.sty.7
       http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/prerex/doc/intro.pdf)
md5sums=('84ae35504e18ad5925d035f3d9c53556'
         '8e80e9bfb21d9b8a00790561649a4da2'
         '926c526842ca745239157aa354d58d23'
         'b382f8e2dd3c73efa592cea0228fa565'
         '750ae217b798355c75974267d4a7c979')

prepare () {
  cd $srcdir/$pkgname-$pkgver
  # replace xterm by your favourite terminal emulator here
  sed -i s+xterm+evilvte+ $srcdir/v$pkgname-$_vver/window.cpp
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make 
  
  cd $srcdir/v$pkgname-$_vver
  qmake-qt4 vprerex.pro
  make
}

package () {
  install -Dm644 $pkgname.sty \
	  $pkgdir/usr/share/texmf/tex/latex/$pkgname.sty
  install -Dm644 $pkgname.sty.7 \
	  $pkgdir/usr/share/man/man7/$pkgname.sty.7 
  install -Dm644 intro.pdf \
	  $pkgdir/usr/share/doc/$pkgname/intro.pdf 
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  cd $srcdir/v$pkgname-$_vver
  install -Dm755 vprerex $pkgdir/usr/bin/vprerex
  install -Dm644 vprerex.1 $pkgdir/usr/share/man/man1/vprerex.1
  install -Dm644 vprerex.desktop \
	  $pkgdir/usr/share/applications/vprerex.desktop
}
