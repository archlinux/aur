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
pkgver=1.4.1
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science, and engineering."
arch=('i686' 'x86_64')
url="http://www.scipy.org/"
license=('BSD')
makedepends=('gcc-fortran' 'python-numpy-openblas' 'python-setuptools' 'openblas-lapack')
checkdepends=('python-pytest')
source=("https://github.com/scipy/scipy/releases/download/v${pkgver}/scipy-${pkgver}.tar.gz")
sha512sums=('79407a2cbb4ba29c0941570181df4d7835e5791e50a3abef9b63c2fc5b15308a2e4964eb71cdebbee8cd2dcb8e497cf92fe50ee21fb12cac3013ea5e0466b25d')


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
