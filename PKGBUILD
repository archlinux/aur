# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=python-pyface
pkgname=('python2-pyface' 'python-pyface')
pkgver=5.0.0
pkgrel=2
pkgdesc="Traits-capable windowing framework"
arch=('any')
url="https://github.com/enthought/pyface"
license=('BSD')
makedepends=('python-setuptools' 'python-traits' 'python2-setuptools' 'python2-traits')
options=(!emptydirs)

source=("pyface-${pkgver}.tar.gz::https://github.com/enthought/pyface/archive/${pkgver}.tar.gz"
        "ipython_widget.patch")
md5sums=('74e0c8f8099d69bf6f18651b626648d8'
         'e2723b5e4191457de7584f0cddce7a4d')

prepare() {
  cd "$srcdir"
  patch -p0 < ipython_widget.patch
  cp -a pyface-${pkgver} pyface-py2-${pkgver}
}

build() {
  cd "$srcdir"/pyface-py2-$pkgver

  msg "Building Python2"
  python2 setup.py build

  cd "$srcdir"/pyface-$pkgver

  msg "Building Python3"
  python setup.py build
}

package_python2-pyface() {
  depends=('python2-traits')
  optdepends=('python2-pyqt4: for Qt backend (or python2-pyside)'
              'python2-pyside: for Qt backend (or python2-pyqt4)'
              'wxpython: for wx backend')

  cd "$srcdir"/pyface-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-pyface() {
  depends=('python-traits')
  optdepends=('python-pyqt4: for Qt backend (or python2-pyside)'
              'python-pyside: for Qt backend (or python2-pyqt4)')

  cd "$srcdir"/pyface-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
