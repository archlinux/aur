# Maintainer: xia0er <xia0er@gmail.com>
# Contributor: Xyne <xyne@archlinux.ca>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel "angvp" Velasquez <angvp[at]archlinux.com.ve> 

pkgname="python-numpy-openblas"
pkgver=1.23.1
pkgrel=1
pkgdesc="Scientific tools for Python - built with openblas"
arch=("i686" "x86_64")
license=("custom")
url="http://numpy.org/"
depends=("python" "cython" "openblas-lapack")
optdepends=("python-nose: testsuite")
provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
conflicts=("python3-numpy" "python-numpy")
makedepends=('cblas' 'lapack' 'python' 'python-setuptools' 'gcc-fortran' 'python-nose' 'cython' 'python-hypothesis')
checkdepends=('python-pytest')
options=('staticlibs')
source=("python-numpy-$pkgver.tar.gz::https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha256sums=('d748ef349bfef2e1194b59da37ed5a29c19ea8d7e6342019921ba2ba4fd8b624')

build() {
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"
  
  cd numpy-$pkgver

  NPY_BLAS_ORDER=openblas NPY_LAPACK_ORDER=openblas python setup.py config_fc --fcompiler=gnu95 build
}

check() {
  cd numpy-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/${python_version}/site-packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver

  python setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/python-numpy/
}

