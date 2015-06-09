# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pycoin
pkgver=0.52
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('29c8bede819f55d82f40d514781b99ed')
sha256sums=('03d6f3bd16a737476091ae83e9d6cde7ac23a270a3d5dabf5e1c19dd3cb1492e')
provides=('pycoin2' 'python2-pycoin')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Renaming binaries...'
  for _bin in block bu cache_tx fetch_unspent genwallet ku spend tx; do
    mv "$pkgdir/usr/bin/$_bin" "$pkgdir/usr/bin/pycoin2-$_bin"
  done
}
