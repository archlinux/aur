# Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgbase="python-theano"
pkgname=("python-theano" "python2-theano")
_pkgname="Theano"
pkgver="0.8.0"
pkgrel="0"
pkgdesc='Definition and optimized evaluation of mathematical expressions on Numpy arrays.'
arch=('any')
url='http://www.deeplearning.net/software/theano/'
license=('BSD')
depends=('python'  'python-numpy' 
         'python2' 'python2-numpy')
makedepends=('python-distribute' 'python2-distribute')
checkdepends=('python-nose'      'python2-nose')
optdepends=('python-sympy: Recommended'
            'cuda>=7.0:'    #Can cause tests to fail
            'python-pydot-ng: Preferred over python-pydot'
            'python-pydot'
            'python-pygpu: minimal support for opencl' # Can cause tests to fail
            'python2-sympy'
            'python2-pydot-ng'
            'python-pydot'
            'python2-pygpu')
source=("http://pypi.python.org/packages/source/T/Theano/Theano-${pkgver}.tar.gz")
sha256sums=('87f117277ebc3a3cd5394d2ae3e65a2aa3f8da3265a33e2a5c1ee63a9e6bceb5')

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

# Test takes 3+ hours and over 10Gb of RAM/SWAP
# All tests passed on my machine except the following:

# ERROR: test_err_bound_list (theano.tensor.tests.test_subtensor.T_subtensor)
# ----------------------------------------------------------------------
# IndexError: index 4 is out of bounds for axis 0 with size 2


#check() {
#  msg "Checking Python 2"
#  cd "$srcdir/${_pkgname}-${pkgver}-py2"/build/lib/theano/
#  THEANO_FLAGS='device=cpu,optdb.max_use_ratio=40' OMP_NUM_THREADS=4 \
#  ../../scripts-2.7/theano-nose -v
#   
#  msg "Checking Python 3"
#  cd "$srcdir/${_pkgname}-${pkgver}"/build/lib/theano/
#  THEANO_FLAGS='device=cpu,optdb.max_use_ratio=200' OMP_NUM_THREADS=4 \
#  ../../scripts-3.5/theano-nose
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
