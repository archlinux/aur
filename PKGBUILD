# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=pysztaki-svn
_pkgname=pysztaki
pkgver=9
pkgrel=3
pkgdesc="Translator script for console using the szotar.sztaki.hu database"
arch=('any')
url="http://code.google.com/p/pysztaki/"
license=('BSD')
depends=('python2-beautifulsoup3')
makedepends=('subversion')
source=("$_pkgname::svn+http://pysztaki.googlecode.com/svn/trunk/"
        'LICENSE')
md5sums=('SKIP'
         '73c04eba22d5814ff62c1b2dc8f446c5')

pkgver() {
  cd "$srcdir/$_pkgname"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "$srcdir/$_pkgname"

  # Fix SZTAKI URL
  sed -i 's|http://szotar.sztaki.hu|http://regiszotar.sztaki.hu|' pysztaki/sztakiconfig.py

  # Fix encoding
  sed -i 's|iso8859-2|utf-8|' sztaki.py
}

build() {
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
  ln -s sztaki.py "$pkgdir/usr/bin/pysztaki"
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
