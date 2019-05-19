# Maintainer: ptrr <piksarv .at. gmail.com>
# Contributor: lobisquit <enricolovisotto@gmail.com>
# Contributor: chmgtr1 <chmgtr1@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Bodor Dávid Gábor <david.gabor.bodor@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname="python-scipy-openblas"
pkgver=1.3.0
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science, and engineering."
arch=('i686' 'x86_64')
url="http://www.scipy.org/"
license=('BSD')
makedepends=('gcc-fortran' 'python-numpy-openblas' 'python-setuptools' 'openblas-lapack')
checkdepends=('python-pytest')
source=("https://github.com/scipy/scipy/releases/download/v${pkgver}/scipy-${pkgver}.tar.gz")
sha256sums=('c3bb4bd2aca82fb498247deeac12265921fe231502a6bc6edea3ee7fe6c40a7a')


build() {
  export BLAS=/usr/lib/libblas.so
  export LAPACK=/usr/lib/liblapack.so
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"
  
  cd scipy-${pkgver}
  python setup.py config_fc --fcompiler=gnu95 build
}

check() {
  _pyver=$(python -c 'import sys; v = sys.version_info; print(f"{v.major}.{v.minor}")')

  # we need to do a temp install so we can import scipy
  # also, the tests must not be run from the scipy source directory
  export BLAS=/usr/lib/libblas.so
  export LAPACK=/usr/lib/liblapack.so
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  cd ${srcdir}/scipy-${pkgver}
  python setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root=${srcdir}/test --optimize=1
  export PYTHONPATH=${srcdir}/test/usr/lib/python${_pyver}/site-packages
  cd ${srcdir}
  python -c "from scipy import test; test('full')"
}

package_python-scipy-openblas() {
  depends=('python-numpy-openblas' 'openblas-lapack')
  provides=('python3-scipy' 'python-scipy')
  optdepends=('python-pillow: for image saving module')
  conflicts=('python-scipy')
  
  cd scipy-${pkgver}
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  python setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root=${pkgdir} --optimize=1

  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/python-scipy/LICENSE"
}
