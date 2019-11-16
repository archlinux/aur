# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=prerex  
pkgver=6.8.0
_vver=6.5.1
pkgrel=3
pkgdesc="a LaTeX document style for prerequisite charts"
url="http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/prerex"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libedit' 'poppler-qt5')
install=prerex.install
source=("http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/doc/$pkgname-$pkgver.tar.gz"
	"http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/doc/v$pkgname-${_vver}.tar.gz"
	"http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/$pkgname/$pkgname.sty"
	http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/prerex/doc/prerex.sty.7
       http://ftp.math.purdue.edu/mirrors/ctan.org/graphics/prerex/doc/intro.pdf)
sha256sums=('32defe69d3c04e3e1d13d0cb427666dcb8fcca9bf9d9d004873538b79a2516fa'
            'fef226574a214d39d4f09017b29167b4efc24bc9f592d69f56127d7e0d33245b'
            '55a852cf6fa8f478a540331907b534f8959037ae35e7b521bcf8a2a77d5460a6'
            'a29f7c75ab58654ba51d6b3f5923b8a3a0b704f8910dfc8ea50974c50a563846'
            '18fe08ff3cdc7ed0d3f7887858e42dcffb485e8b1f49956fe5b926e9b21849fa')

prepare () {
  cd $pkgname-$pkgver
  # replace xterm by your favourite terminal emulator here
  sed -i s+xterm+st+ "$srcdir"/v$pkgname-$_vver/window.cpp
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr 
  make 
  
  cd ../v$pkgname-$_vver
  qmake-qt5 vprerex.pro
  make
}

package () {
  install -Dm644 $pkgname.sty \
	  "$pkgdir"/usr/share/texmf/tex/latex/$pkgname.sty
  install -Dm644 $pkgname.sty.7 \
	  "$pkgdir"/usr/share/man/man7/$pkgname.sty.7 
  install -Dm644 intro.pdf \
	  "$pkgdir"/usr/share/doc/$pkgname/intro.pdf 
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  cd "$srcdir"/v$pkgname-$_vver
  install -Dm755 vprerex "$pkgdir"/usr/bin/vprerex
  install -Dm644 vprerex.1 "$pkgdir"/usr/share/man/man1/vprerex.1
  install -Dm644 vprerex.desktop \
	  "$pkgdir"/usr/share/applications/vprerex.desktop
}
