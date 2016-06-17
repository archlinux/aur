# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pycoin
pkgver=0.70
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/1a/7d/c7e3cff25378560080a0d927975c2c0c2435d72b2c319aae922227d00ff9/pycoin-0.70.tar.gz)
md5sums=('865bcd796f63873d678dc75687a82861')
sha256sums=('5057b55c56582044c8f73ad5e5ca3d27d3032c33cbff4d808915c37b78ffcd25')
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
