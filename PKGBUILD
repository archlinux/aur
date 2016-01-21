# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-bitcointools
pkgver=1.1.42
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=('any')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz
	https://github.com/vbuterin/pybitcointools/blob/master/bitcoin/english.txt)

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

#  msg2 'Fixing setup.py...'
  sed -i '/data_files.*/d' setup.py

#  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  touch LICENSE
  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Renaming pybtctool to pybtctool2...'
  mv "$pkgdir/usr/bin/pybtctool" "$pkgdir/usr/bin/pybtctool2"

  msg2 'Add english wordlist'
  cp ../english.txt $pkgdir/usr/lib/python2.7/site-packages/bitcointools/

}

md5sums=('93f1f9f18d0cb4022097b0dc45ed60d3'
	 'SKIP')
