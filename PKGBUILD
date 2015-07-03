# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-ethereum-serpent
pkgver=1.8.4
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
md5sums=('732b2bb5b277eaf60e059817b1289584')
sha256sums=('6f8808982f24dd0e9c11b2982eca4aa47073b3434c48d4cf41a7267f57885e9e')

prepare() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Makefile...'
  sed -i "s@/usr/local@/usr@g" Makefile

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Removing conflicting serpent binary...'
  rm -f "$pkgdir/usr/bin/serpent"
}
