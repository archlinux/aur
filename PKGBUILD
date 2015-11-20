# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pycoin
pkgver=0.62
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('14306b883b6c82bc59023bee7687398e')
sha256sums=('289b059339b07ccfdd828ead412218369730c12ba93fe50222d2707a276d2f55')
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
