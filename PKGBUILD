# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-ethereum-serpent
pkgver=2.0.1
pkgrel=1
pkgdesc="Serpent compiler, installed as a Python module"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('gcc' 'make' 'python2-setuptools')
groups=('ethereum')
url="https://www.ethereum.org"
license=('WTFPL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/e/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('a1507bab442bbd2a9e9f172c29af877a')
sha256sums=('09da7bf4891ed6307edc43d2c1f49db02e94b30521ab99bc2ff1168d0f8f06c4')

prepare() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Fixing Makefile...'
  sed -i "s@/usr/local@/usr@g" Makefile

  msg2 'Fixing Python version...'
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

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Removing conflicting serpent binary...'
  rm -f "$pkgdir/usr/bin/serpent"
}
