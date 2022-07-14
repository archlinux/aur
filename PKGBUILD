# Contributor: perlawk
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jacal
pkgver=1c7
pkgrel=1
pkgdesc="A symbolic mathematics system written in Scheme."
url="http://people.csail.mit.edu/jaffer/JACAL.html"
arch=('any')
license=('GPL3')
depends=('scm' 'slib')
source=(http://groups.csail.mit.edu/mac/ftpdir/scm/$pkgname-$pkgver.zip
        fix-makefile.patch)
sha256sums=('bf93157ffc4251b7da99f50815161060a180a61f0f25d4ec5dc2b41953d74519'
            '4d210ad4c43b08d016e69c17609c0c2cf860fee41d4a90b6e377c83031732572')
options=('!makeflags')

build() {
  export SCHEME_LIBRARY_PATH=/usr/share/slib/
  cd $srcdir/$pkgname

  patch --forward --strip=1 --input="${srcdir}/fix-makefile.patch"

  sh ./configure --prefix=/usr --exec-prefix=/usr
  sed -i 's/jacal-$(VERSION).info/jacal.info/g;' Makefile
  
  make -k
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
  rmdir $pkgdir/usr/share/doc/$pkgname
}
