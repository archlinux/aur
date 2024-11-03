# Maintainer: crl <crl18039102576@126.com>
pkgname=python-numpy-mkl-tbb
pkgver=2.1.2
pkgrel=1
pkgdesc="Scientific tools for Python, compiled with Intel MKL and TBB"
arch=(x86_64)
license=(BSD-3-Clause)
url="https://numpy.org"
provides=("python-numpy=$pkgver")
conflicts=(python-numpy python-numpy-mkl python-numpy-mkl-debug)
depends=(python intel-oneapi-mkl intel-oneapi-mkl)
makedepends=(python-build python-installer meson-python python-setuptools cython gcc-fortran procps-ng)
checkdepends=(python-pytest python-hypothesis)
optdepends=('python-threadpoolctl: for show_runtime() support')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('3d69f6583e093e8fd0f441ec7dc4658c88fb714bb29574cd9510091ba059553f79c52492037353caf50b6cff1f7bd1e2501e445c7adde41bd9e08bab363e06e9')

build() {
  source /opt/intel/oneapi/setvars.sh
  cd numpy-$pkgver
  python -m build --wheel --no-isolation \
    -Csetup-args="-Dblas=mkl-dynamic-lp64-tbb" \
    -Csetup-args="-Dlapack=mkl-dynamic-lp64-tbb"
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
