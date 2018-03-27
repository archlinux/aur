# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=prerex  
pkgver=6.5.4
_vver=6.5.1
pkgrel=3
pkgdesc="a LaTeX document style for prerequisite charts"
url="http://www.prerex.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libedit' 'poppler-qt5')
install=prerex.install
source=("http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/doc/$pkgname-$pkgver.tar.gz"
	"http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/doc/v$pkgname-${_vver}.tar.gz"
	"http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/$pkgname.sty"
	http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/prerex/doc/prerex.sty.7
       http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/prerex/doc/intro.pdf)
sha256sums=('9a4a288120fc9284510b0b2da3af2661f8f378c682106c4449bd8d97dd18a1f3'
            'fef226574a214d39d4f09017b29167b4efc24bc9f592d69f56127d7e0d33245b'
            '5c194defee4c917a82232b410547b9a3ecefa8a714f727a1028860a878cf1ca1'
            'fedb558717e115d79c1a3610001b4ecfaaf9236c89ccc4336d147b7427a5a448'
            '18fe08ff3cdc7ed0d3f7887858e42dcffb485e8b1f49956fe5b926e9b21849fa')

prepare () {
  cd $srcdir/$pkgname-$pkgver
  # replace xterm by your favourite terminal emulator here
  sed -i s+xterm+st+ $srcdir/v$pkgname-$_vver/window.cpp
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make 
  
  cd $srcdir/v$pkgname-$_vver
  qmake-qt5 vprerex.pro
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
