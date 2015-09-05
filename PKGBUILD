# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgbase=python-control
pkgname=('python2-control' 'python-control')
pkgver=0.6d
pkgrel=1
pkgdesc="Implements basic operations for analysis and design of feedback control systems in Python"
arch=('any')
license=('BSD')
url="http://sourceforge.net/projects/python-control"
depends=('python-scipy'
         'python-matplotlib')
makedepends=('python-setuptools' 'python2-setuptools' 'gcc-fortran')
checkdepends=('python-nose' 'python2-nose')
options=('staticlibs')
source=("http://downloads.sourceforge.net/python-control/control-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('4c5203ac7d742382a4572f6ac7445bc7'
         '5e21e2b8826c3345f50711d5634bc975')

prepare() {
  cp -a control-$pkgver control-py2-$pkgver
  cd control-py2-$pkgver

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd control-py2-$pkgver
  python2 setup.py build

  echo "Building Python3"
  cd ../control-$pkgver
  python setup.py build
}

package_python2-control() {
  _pyver=2.7

  export LDFLAGS="$LDFLAGS -shared"

  cd control-py2-$pkgver
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-control"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/python2-control/"
}

package_python-control() {
  provides=('python3-control')

  _pyver=3.4
  _pyinc=3.4m

  export LDFLAGS="$LDFLAGS -shared"

  cd control-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-control"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/python-control/"
}
