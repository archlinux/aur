# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
# Original author: David McInnis<davidm@eagles.ewu.edu>

pkgbase="python-theano-git"
pkgname=("python-theano-git" "python2-theano-git")
pkgver=0.7.1a1.r1364.33c9760
pkgrel=1
pkgdesc='Definition and optimized evaluation of mathematical expressions on Numpy arrays.'
arch=('any')
url='http://www.deeplearning.net/software/theano/'
license=('BSD')
conflicts=('python-theano' 'python2-theano')
provides=('python-theano' 'python2-theano')
depends=('python'  'python-numpy' 'python-six'
         'python2' 'python2-numpy' 'python2-six')
makedepends=('python-distribute' 'python2-distribute')
checkdepends=('python-nose'      'python2-nose')
optdepends=('python-pycuda' 'python-pydot'
            'python2-pycuda' 'python2-pydot')
source=("python-theano::git+https://github.com/Theano/Theano.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgbase%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^rel\.//')"

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

package_python2-theano-git() {
  depends=('python2' 'python2-numpy' 'python2-six')
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
  depends=('python' 'python-numpy' 'python-six')
  optdepends=('python-pycuda' 'python-pydot')
  provides=('python-theano')
  conflicts=('python-theano')
  cd "$srcdir/${pkgbase%-git}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-theano"
}
