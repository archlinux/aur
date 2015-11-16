# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pycoin
pkgver=0.60
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('8a011ecbf7bd622fa3a787041ee07be7')
sha256sums=('b27214ad0471d3c557ec0f493a912110b290aae621a43edbb1f4eb8c4e50825d')
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
