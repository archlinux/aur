# Contributor: Taylor Venable <taylor@metasyntax.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='gauche-git'
pkgver=0.9.4.538.gbc0653f
pkgrel=1
pkgdesc="R5RS Scheme implementation developed to be a handy script interpreter"
arch=('i686' 'x86_64')
url='http://practical-scheme.net/gauche/index.html'
license=('BSD')
depends=('zlib' 'sh' 'gdbm')
#makedepends=('gauche') # only needed if this is the first build of gauche-git
provides=('gauche')
conflicts=('gauche')
source=('git+https://github.com/shirok/Gauche.git')
md5sums=('SKIP')
install="$pkgname.install"
_gitname='Gauche'
options=('!makeflags')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed s+[-_]+.+g | cut -c8-
}

prepare() {
  cd "$srcdir/$_gitname"/lib
  sed -i '123,126d' Makefile.in
}
  
build() {
  cd "$srcdir/$_gitname"
  ./DIST gen
  CC=gcc ./configure --prefix=/usr --enable-multibyte=utf-8 \
	      --enable-threads=pthreads 
  make DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
