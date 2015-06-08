
# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Bodor DÃ¡vid GÃ¡bor <david.gabor.bodor@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgbase="python-scipy-mkl"
pkgname="python-scipy-mkl"
true && pkgname=('python-scipy-mkl' 'python2-scipy-mkl')

pkgver=0.15.1
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science, and engineering. Compiled with intel MKL"
arch=('i686' 'x86_64')
url="http://www.scipy.org/"
license=('BSD')
makedepends=('intel-fortran-compiler' 'intel-compiler-base' 'intel-mkl' 'python-numpy' 'python2-numpy' 'swig')
checkdepends=('python-nose' 'python2-nose')
source=("http://downloads.sourceforge.net/scipy/scipy-${pkgver}.tar.gz" )

md5sums=( 'be56cd8e60591d6332aac792a5880110' )

build() {
  unset LDFLAGS
  unset FFLAGS
  export LDFLAGS="" 
  export FFLAGS="-fPIC -openmp"

  # Changing the arithmetic parameter (Thanks to Fabrizio Castellano)
  sed -i "s/\#define\ UNK\ 1/\#define\ IBMPC\ 1/" \
    scipy-${pkgver}/scipy/special/cephes/mconf.h

  # 2 builds
  cp -r scipy-${pkgver} scipy-${pkgver}-py2

  # build for python3
  cd scipy-${pkgver}
  #patch -Np1   -i $srcdir/0001-GEN-regenerate-C-sources-with-Cython-0.17.1.patch

  python setup.py build --fcompiler=intelem --compiler=intel

  # build for python2
  cd ../scipy-${pkgver}-py2

  for file in $(find . -name '*.py' -print); do
       sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
       sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build --fcompiler=intelem --compiler=intel
}

check() {
  cd scipy-${pkgver}
# figure out how to run tests in the source tree easily
#  python -c "from scipy import test; test('full')"

  cd ../scipy-${pkgver}-py2
# figure out how to run tests in the source tree easily
#  python2 -c "from scipy import test; test('full')"
}

package_python2-scipy-mkl() {
  depends=('python2-numpy-mkl' 'qhull' 'python2-nose' )
  provides=('python2-scipy=${pkgver}' 'scipy=${pkgver}')
  replaces=('python2-scipy')
  conflicts=('python2-scipy')

  cd scipy-${pkgver}-py2

  python2 setup.py config_fc --fcompiler=intel install \
    --prefix=/usr --root=${pkgdir} --optimize=1

  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/python2-scipy/LICENSE"
}

package_python-scipy-mkl() {
  depends=('python-numpy-mkl' 'qhull' 'python-nose')
  provides=('python3-scipy=${pkgver}' 'python-scipy=${pkgver}' 'scipy=${pkgver}')
  replaces=('python-scipy')
  conflicts=('python-scipy')
  

  cd scipy-${pkgver}

  python setup.py config_fc --fcompiler=intel install \
    --prefix=/usr --root=${pkgdir} --optimize=1

  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/python-scipy/LICENSE"
}
