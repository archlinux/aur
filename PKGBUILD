# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgbase=python-control
pkgname=('python2-control' 'python-control')
pkgver=0.7.0
pkgrel=6
pkgdesc="Implements basic operations for analysis and design of feedback control systems in Python"
arch=('any')
license=('BSD')
url="https://github.com/python-control/python-control"
depends=('python-scipy'
         'python-matplotlib')
optdepends=('python-slycot-git: matrix equation support, model simplification tools, and state feedback')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose' 'python-slycot-git')
options=('staticlibs')
source=("https://github.com/python-control/python-control/archive/${pkgver}.tar.gz"
        "LICENSE")
md5sums=('9ae5f99eb8e8ec242b108bbbcea0c990'
         '5e21e2b8826c3345f50711d5634bc975')

prepare() {
  cp -a python-control-$pkgver python2-control-$pkgver
  cd python2-control-$pkgver

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd python2-control-$pkgver
  python2 setup.py build

  echo "Building Python3"
  cd ../python-control-$pkgver
  python setup.py build
}

check() {
  cd python-control-$pkgver
  python setup.py test
}

package_python2-control() {
  export LDFLAGS="$LDFLAGS -shared"

  cd python2-control-$pkgver
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-control"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/python2-control/"
}

package_python-control() {
  provides=('python3-control')

  export LDFLAGS="$LDFLAGS -shared"

  cd python-control-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-control"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/python-control/"
}
