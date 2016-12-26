# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=python-apptools
pkgname=('python2-apptools' 'python-apptools')
pkgver=4.4.0
pkgrel=2
pkgdesc="Application tools"
arch=('any')
url="https://github.com/enthought/apptools"
license=('BSD')
makedepends=('python-setuptools' 'python-traits' 'python2-setuptools' 'python2-traits')

source=("apptools-$pkgver.tar.gz::https://github.com/enthought/apptools/archive/${pkgver}.tar.gz")
md5sums=('7ca7ec191d20533ff7106f3ca3f951c1')

prepare() {
  cd "$srcdir"
  cp -a apptools-${pkgver} apptools-py2-${pkgver}

  cd apptools-py2-${pkgver}
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${srcdir}" -name '*.py')
}

build() {
  cd "$srcdir"/apptools-py2-$pkgver

  msg "Building Python2"
  python2 setup.py build

  cd "$srcdir"/apptools-$pkgver

  msg "Building Python3"
  python setup.py build
}

package_python2-apptools() {
  depends=('python2-traits')
  optdepends=('python2-configobj: for apptools.preferences package'
              'python2-traitsui: for user interface to apptools')
  cd "$srcdir"/apptools-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/  --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-apptools() {
  depends=('python-traits')
  optdepends=('python-configobj: for apptools.preferences package'
              'python-traitsui: for user interface to apptools')
  cd "$srcdir"/apptools-$pkgver

  python setup.py install --root="$pkgdir"/  --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

