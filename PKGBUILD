# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
# Original author: David McInnis<davidm@eagles.ewu.edu>

pkgbase="python-theano-git"
pkgname=("python-theano-git" "python2-theano-git")
_pkgname="Theano"
pkgver=rel.0.7.1a1.r1287.4260bbf
pkgrel=1
pkgdesc='Definition and optimized evaluation of mathematical expressions on Numpy arrays.'
arch=('any')
url='http://www.deeplearning.net/software/theano/'
license=('BSD')
conflicts=('python-theano' 'python2-theano')
provides=('python-theano' 'python2-theano')
depends=('python'  'python-numpy' 
         'python2' 'python2-numpy')
makedepends=('python-distribute' 'python2-distribute')
checkdepends=('python-nose'      'python2-nose')
optdepends=('python-pycuda' 'python-pydot'
            'python2-pycuda' 'python2-pydot')
source=("python-theano::git+https://github.com/Theano/Theano.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgbase%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

prepare() {
  cd "$srcdir/"
  cp -a "${pkgbase%-git}" "${pkgbase%-git}-py2"
  cd "${pkgbase%-git}-py2"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 2"
  cd "$srcdir/${pkgbase%-git}-py2"
  python2 setup.py build
  cp -f build/scripts-2*/* bin/


  msg "Building Python 3"
  cd "$srcdir/${pkgbase%-git}"
  python setup.py build
  cp -f build/scripts-3*/* bin/
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

package_python2-theano-git() {
  depends=('python2' 'python2-numpy')
  optdepends=('python2-pycuda' 'python2-pydot')
  provides=('python2-theano')
  conflicts=('python2-theano')
  cd "$srcdir/${pkgbase%-git}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  mv "${pkgdir}/usr/bin/theano-cache" "${pkgdir}/usr/bin/theano2-cache"
  mv "${pkgdir}/usr/bin/theano-nose" "${pkgdir}/usr/bin/theano2-nose"
  mv "${pkgdir}/usr/bin/theano-test" "${pkgdir}/usr/bin/theano2-test"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-theano"
}

package_python-theano-git() {
  depends=('python' 'python-numpy')
  optdepends=('python-pycuda' 'python-pydot')
  provides=('python-theano')
  conflicts=('python-theano')
  cd "$srcdir/${pkgbase%-git}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-theano"
}
