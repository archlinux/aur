# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pycoin
pkgver=0.61
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('c5f1cc46487e585ea21af3c5cc416392')
sha256sums=('4ea2ee72c455e477a4b680888fa133b3b6755f65b00327d0acf2c3398793654e')
provides=('pycoin2' 'python2-pycoin')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Renaming binaries...'
  for _bin in $(find "$pkgdir/usr/bin" -mindepth 1 -type f -printf '%f\n'); do
    mv "$pkgdir/usr/bin/$_bin" "$pkgdir/usr/bin/pycoin2-$_bin"
  done
}
