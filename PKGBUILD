# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgbase=python-control-git
pkgname=('python2-control-git' 'python-control-git')
pkgver=662.601b581
pkgrel=1
pkgdesc="Implements basic operations for analysis and design of feedback control systems in Python"
arch=('any')
license=('BSD')
url="https://github.com/python-control/python-control"
depends=('python-scipy'
         'python-matplotlib')
optdepends=('python-slycot-git: matrix equation support, model simplification tools, and state feedback')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose' 'python-slycot-git')
options=('staticlibs')
source=("git+https://github.com/python-control/python-control.git"
        "LICENSE")
md5sums=('SKIP'
         '5e21e2b8826c3345f50711d5634bc975')

pkgver() {
  cd "$srcdir/python-control"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cp -a python-control python2-control
  cd python2-control

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd python2-control
  python2 setup.py build

  echo "Building Python3"
  cd ../python-control
  python setup.py build
}

check() {
  cd python-control
  python setup.py test
}

package_python2-control-git() {
  export LDFLAGS="$LDFLAGS -shared"

  cd python2-control
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-control"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/python2-control/"
}

package_python-control-git() {
  provides=('python3-control')

  export LDFLAGS="$LDFLAGS -shared"

  cd python-control
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-control"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/python-control/"
}
