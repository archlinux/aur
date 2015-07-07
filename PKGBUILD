# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-enable
pkgver=4.5.1
pkgrel=1
pkgdesc="Low-level drawing and interaction packages"
arch=('i686' 'x86_64')
url="https://github.com/enthought/enable"
license=('BSD')
depends=('python2-reportlab' 'python2-traitsui' 'glu')
makedepends=('python2-distribute' 'cython2' 'swig')
conflicts=('python-enthought-enable' 'python2-enable-git' 'python-ets-enable-svn')
options=(!emptydirs)

source=("$pkgname.tar.gz::https://github.com/enthought/enable/archive/${pkgver}.tar.gz" "swig.patch" "gcc5.patch")
md5sums=('f25368400538909de5b165f1d9697ca0'
         'bb0c5bbda3091c9b77fa74520eb84695'
         '0c1d220157b8b6d0b6c82b704b5156e3')

prepare() {
  cd "$srcdir"/enable-$pkgver

  patch -p 1 < ../swig.patch
  patch -p 0 < ../gcc5.patch

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir"/enable-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/enable-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

