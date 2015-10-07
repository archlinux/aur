# Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgbase="python-theano"
pkgname=("python-theano" "python2-theano")
_pkgname="Theano"
pkgver="0.7.0"
pkgrel="3"
pkgdesc='Definition and optimized evaluation of mathematical expressions on Numpy arrays.'
arch=('any')
url='http://www.deeplearning.net/software/theano/'
license=('BSD')
depends=('python'  'python-numpy' 
         'python2' 'python2-numpy')
makedepends=('python-distribute' 'python2-distribute')
checkdepends=('python-nose'      'python2-nose')
optdepends=('python-sympy' 'python-pycuda' 'python-pydot'
            'python2-sympy' 'python2-pycuda' 'python2-pydot')
source=("http://pypi.python.org/packages/source/T/Theano/Theano-${pkgver}.tar.gz")
sha256sums=('05b0f6d2467735abea13bdc5c2c1ce3c53f1b89f9ebc5a43abdf71f88cf818b3')

prepare() {
  cd "$srcdir/"
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
  cd "${_pkgname}-${pkgver}"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 2"
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
  cp -f build/scripts-2.7/* bin/


  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
  cp -f build/scripts-3.5/* bin/
}

# Check always fails on non-64 bit platforms.  Check frequently fails if optional dependencies are present
# Even if check succeeds it takes hours to complete
#
#check() {
#  msg "Checking Python 2"
#  cd "$srcdir/${_pkgname}-${pkgver}-py2"/build/lib/theano/
#  ../../scripts-2.7/theano-nose -v
#   
#   
#  msg "Checking Python 3"
#  cd "$srcdir/${_pkgname}-${pkgver}"/build/lib/theano/
#  ../../scripts-3.4/theano-nose -v
#}

package_python2-theano() {
  depends=('python2' 'python2-numpy')
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  mv "${pkgdir}/usr/bin/theano-cache" "${pkgdir}/usr/bin/theano2-cache"
  mv "${pkgdir}/usr/bin/theano-nose" "${pkgdir}/usr/bin/theano2-nose"
  mv "${pkgdir}/usr/bin/theano-test" "${pkgdir}/usr/bin/theano2-test"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-theano"
}

package_python-theano() {
  depends=('python' 'python-numpy')
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-theano"
}