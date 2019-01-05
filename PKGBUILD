# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sagemath-p_group_cohomology
pkgver=3.1
pkgrel=1
pkgdesc="p-group cohomology package for Sagemath"
arch=(x86_64)
url="https://users.fmi.uni-jena.de/cohomology/"
license=(GPL)
depends=(sagemath shared_meataxe)
makedepends=(cython2)
source=(https://users.fmi.uni-jena.de/cohomology/p_group_cohomology-$pkgver.tar.xz)
sha256sums=('8b2d2cc3a139605779239b2dda2b7f0f060249091a0eadc9ff210f1ae1fabbd5')

build() {
  cd p_group_cohomology-$pkgver/csources
  ./configure --prefix=/usr
  make
  # install to temp dir so we can build pyxsources
  make DESTDIR="$PWD/../tmp" install

  cd ../pyxsources
  export CFLAGS+=" -I$PWD/../tmp/usr/include"
  export LDFLAGS+=" -L$PWD/../tmp/usr/lib"
  python2 setup.py build
}

package() {
  cd p_group_cohomology-$pkgver/csources
  make DESTDIR="$pkgdir" install

  cd ../pyxsources
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

# Fix file ownership
  chown -R root:root "$pkgdir"/usr/share
}
