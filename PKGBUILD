# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antony Lee <anntzer.lee@gmail.com>
_base=pyFFTW
pkgname=python-${_base,,}
pkgver=0.13.1
pkgrel=5
pkgdesc="A pythonic wrapper around FFTW"
arch=(i686 x86_64)
url="https://github.com/${_base}/${_base}"
license=(BSD-3-Clause)
depends=(fftw python-numpy openmp)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest python-scipy python-dask)
optdepends=('python-scipy: scipy.fftpack support'
  'python-dask: dask.fft support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  cython3.patch::${url}/pull/363.patch
  python312.patch::${url}/pull/370.patch)
sha512sums=('30a627e3abf62ac045478964265d7d675765354c118ad38f44c49748a86c8d7cf83eca872ae156f3a14219190140bfa04b8745a092e481f3df2a8ba417116b42'
            '9e754bfd3f75133250c0cb452316cf5b62e0473320f11cac4e7dc186aea8afcae0ae89cddcf7bb43d76beeaf8f6c7fd1de47dfe30c275739567117e62a8237dc'
            'ff1373d29eb7f0cb5c907c331214c42215d7b0c02aee048ac33806b2c1a0aac850cb27215e39fbfd874f700e505317bc7122244142f2cd81993411b172c60b52')

prepare() {
  cd ${_base}-${pkgver}
  # https://github.com/pyFFTW/pyFFTW/issues/362
  patch -p1 -i ../cython3.patch
  # https://github.com/pyFFTW/pyFFTW/issues/366
  patch -p1 -i ../python312.patch
}

build() {
  cd ${_base}-${pkgver}
  CFLAGS="-Wno-implicit-function-declaration -Wno-incompatible-pointer-types"
  PYFFTW_USE_PTHREADS=1
  python setup.py \
    build_ext \
    --include-dirs=/usr/include \
    --library-dirs=/usr/lib \
    --inplace
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_pyfftw_scipy_fft.py \
    --ignore=tests/test_pyfftw_scipy_interface.py
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
