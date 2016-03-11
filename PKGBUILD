# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=python-traits
pkgname=('python2-traits' 'python-traits')
pkgver=4.5.0
pkgrel=1
pkgdesc="Explicitly typed attributes for Python"
arch=('i686' 'x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
makedepends=('python-setuptools' 'python-numpy' 'python2-setuptools' 'python2-numpy')

source=("$pkgname-$pkgver.tar.gz::https://github.com/enthought/traits/archive/${pkgver}.tar.gz")
md5sums=('b77b08837afd20c1254e5d94369712cd')

prepare() {
  cd "$srcdir"
  cp -a traits-${pkgver} traits-py2-${pkgver}
  cd traits-py2-${pkgver}

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir"/traits-py2-$pkgver

  msg "Building Python2"
  python2 setup.py build

  cd "$srcdir"/traits-$pkgver

  msg "Building Python3"
  python setup.py build
}

package_python2-traits() {
  depends=('python2-numpy')
  cd "$srcdir"/traits-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-traits() {
  depends=('python-numpy')
  cd "$srcdir"/traits-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

