# Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase="python-theano"
pkgname=("python-theano" "python2-theano")
_pkgname="Theano"
pkgver="0.8.1"
pkgrel="1"
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
source=("http://pypi.python.org/packages/source/T/Theano/Theano-${pkgver}.tar.gz"
        "0001-Fix-problem-with-python-3.5.patch")
sha256sums=('2f1d9ad7ecf136e7978a6720fa9286f7b02221c5599b935e9f7fa14cd29cb19d'
            'b522bb513278635487a8e50f5d6b1aca003900cc92fd2450ac843daeb6c69216')

prepare() {
  cd "${_pkgname}-${pkgver}"
  chmod +x "${_pkgname}.egg-info"
  chmod 644 ${_pkgname}.egg-info/*
  patch -p1 < ../0001-Fix-problem-with-python-3.5.patch
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

# Test takes 4+ hours and over 10Gb of RAM/SWAP
# All tests passed on my machine
#-------------------------------------------------
#check() {
#  msg "Checking Python 2"
#  cd "$srcdir/${_pkgname}-${pkgver}-py2"/build/lib/theano/
#    THEANO_FLAGS='device=cpu,\
#                optdb.max_use_ratio=200,\
#                exception_verbosity=high' \
#  OMP_NUM_THREADS=4 \
#  nosetests2 -v -d
#   
#  msg "Checking Python 3"
#  cd "$srcdir/${_pkgname}-${pkgver}"/build/lib/theano/
#  THEANO_FLAGS='device=cpu,\
#                optdb.max_use_ratio=200,\
#                exception_verbosity=high' \
#  OMP_NUM_THREADS=4 \
#  nosetests3 -v -d
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
