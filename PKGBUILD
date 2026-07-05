# Maintainer: crl <crl18039102576@126.com>

pkgname=python-numpy-mkl-tbb
pkgver=2.5.1
pkgrel=1
pkgdesc="Scientific tools for Python, compiled with Intel MKL and TBB"
arch=(x86_64)
license=(BSD-3-Clause)
url="https://numpy.org"
provides=("python-numpy=$pkgver")
conflicts=(python-numpy python-numpy-mkl)
depends=(python intel-oneapi-mkl)
makedepends=(python-build python-installer meson-python python-setuptools cython gcc-fortran procps-ng)
checkdepends=(python-pytest python-hypothesis)
optdepends=('python-threadpoolctl: for show_runtime() support')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha256sums=('a48a113e6afea91f5608793bafa7ef2ad481fefbda87ec5069f483de61cb9fa3')

build() {
  source /opt/intel/oneapi/setvars.sh
  cd numpy-$pkgver
  CFLAGS+=" -ffat-lto-objects" \
  CXXFLAGS+=" -ffat-lto-objects" \
  python -m build --wheel --no-isolation \
    -Csetup-args="-Dblas=mkl-dynamic-lp64-tbb" \
    -Csetup-args="-Dlapack=mkl-dynamic-lp64-tbb" \
    -Csetup-args="-Denable-openmp=true"
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd numpy-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/$site_packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/python-numpy/"
}
