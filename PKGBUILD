# Maintainer: crl <crl18039102576@126.com>
pkgname=python-numpy-mkl-tbb
pkgver=2.1.3
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
sha512sums=('59568acda3a77160908a23c354f0574970cb3daeea79ab535762a75a5f3a52a5cedd5754bb507cc238cf5948b37f0045523ed59c04cf6fc4a94ed22b9b77b8c1')

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
