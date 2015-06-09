# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-tackpy
pkgver=0.9.9a
pkgrel=1
pkgdesc="Implements TACK in pure Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-m2crypto: fast elliptic curve and AES operations')
url="http://tack.io"
license=('custom:public domain')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b00321834abd5cb8c8cd5e547309ba3f')
sha256sums=('041c4d1e4b20bf35ccd472761779506eff2a5bebb126526337cd7d21b894beed')

prepare(){
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing docs...'
  install -Dm 644 README "$pkgdir/usr/share/doc/$pkgname/README"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Renaming binary from tack to tackpy...'
  mv "$pkgdir/usr/bin/tack" "$pkgdir/usr/bin/tackpy"

  msg 'Cleaning up install...'
  install -dm 755 "$pkgdir/usr/share/tackpy"
  mv "$pkgdir/usr/tack.py" "$pkgdir/usr/share/tackpy"
  mv "$pkgdir/usr/testdata" "$pkgdir/usr/share/tackpy"
  rm -f "$pkgdir/usr/LICENSE" "$pkgdir/usr/Makefile"
}
