# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: Dejan Cabrilo <dcabrilo [at] bitspan [dot] rs>

pkgname=tdom
pkgver=0.9.2
pkgrel=1
pkgdesc="A fast XML/DOM/XPath package for Tcl written in C"
arch=('i686' 'x86_64')
url="http://tdom.org"
license=('MPL')
groups=('devel')
depends=('tcl'
	 'gumbo-parser')
source=(http://tdom.org/downloads/tdom-${pkgver}-src.tgz
	no-build-dir.patch)
sha256sums=('232da9c0fc65add1ed12206172a8ccbe7459441e68d3cf9b4da9f3d7f7f9f10b'
            '45c8c54582b55af785c10019271c53cdab0c2a1e4cc858c12af8e217f00cdb48')



prepare() {
  cd "${pkgname}-$pkgver-src"

  patch -p0 -i "$srcdir"/no-build-dir.patch
}

build() {
  cd "${pkgname}-$pkgver-src"
  
  if [ $CARCH = "x86_64" ] ; then
    ./configure --prefix=/usr --enable-64bit --enable-html5
  else
    ./configure --prefix=/usr
  fi
  make
}

check() {
  cd "${pkgname}-$pkgver-src"
  make test
}

package() {
  cd "${pkgname}-$pkgver-src"
  
  make DESTDIR="$pkgdir/" install
  # rm empty directory
  rmdir "$pkgdir/usr/bin"
}
