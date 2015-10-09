# Maintainer: ptrr <piksarv .at. gmail.com>
# Contributor: lobisquit <enricolovisotto@gmail.com>
# Contributor: chmgtr1 <chmgtr1@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Bodor Dávid Gábor <david.gabor.bodor@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=("python-scipy-openblas" "python2-scipy-openblas")
pkgver=0.16.0
pkgrel=2
pkgdesc="SciPy is open-source software for mathematics, science, and engineering."
arch=('i686' 'x86_64')
url="http://www.scipy.org/"
license=('BSD')
makedepends=('gcc-fortran' 'python-numpy-openblas' 'python2-numpy-openblas' 'python-setuptools' 'python2-setuptools' 'openblas-lapack')
checkdepends=('python-nose' 'python2-nose')
source=("http://downloads.sourceforge.net/scipy/scipy-${pkgver}.tar.gz")
md5sums=('eb95dda0f36cc3096673993a350cde77')


build() {
  export BLAS=/usr/lib/libblas.so
  export LAPACK=/usr/lib/liblapack.so
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"
  
  # 2 builds
  cp -r scipy-${pkgver} scipy-${pkgver}-py2

  # build for python3
  cd scipy-${pkgver}
  python3 setup.py config_fc --fcompiler=gnu95 build

  # build for python2
  cd ../scipy-${pkgver}-py2

  for file in $(find . -name '*.py' -print); do
       sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
       sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py config_fc --fcompiler=gnu95 build
}

check() {
  # we need to do a temp install so we can import scipy
  # also, the tests must not be run from the scipy source directory
  export BLAS=/usr/lib/libblas.so
  export LAPACK=/usr/lib/liblapack.so
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  cd ${srcdir}/scipy-${pkgver}
  python3 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root=${srcdir}/test --optimize=1
  export PYTHONPATH=${srcdir}/test/usr/lib/python3.5/site-packages
  cd ${srcdir}
  python -c "from scipy import test; test('full')"

  cd ${srcdir}/scipy-${pkgver}-py2
  python2 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root=${srcdir}/test --optimize=1
  export PYTHONPATH=${srcdir}/test/usr/lib/python2.7/site-packages
  cd ${srcdir}
  python2 -c "from scipy import test; test('full')"
}

package_python-scipy-openblas() {
  depends=('python-numpy-openblas' 'openblas-lapack')
  provides=('python3-scipy' 'python-scipy')
  optdepends=('python-pillow: for image saving module')
  conflicts=('python-scipy')
  
  cd scipy-${pkgver}
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  python3 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root=${pkgdir} --optimize=1

  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/python-scipy/LICENSE"
}

package_python2-scipy-openblas() {
  depends=('python2-numpy-openblas' 'openblas-lapack')
  optdepends=('python2-pillow: for image saving module')
  provides=('python2-scipy')
  conflicts=('python2-scipy')

  cd scipy-${pkgver}-py2
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  python2 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root=${pkgdir} --optimize=1

  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/python2-scipy/LICENSE"
}

