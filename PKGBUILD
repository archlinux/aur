_base=pyFFTW
pkgname=python-${_base,,}
pkgver=0.15.0
pkgrel=1
pkgdesc="A pythonic wrapper around FFTW"
arch=(x86_64 aarch64)
url="https://github.com/${_base}/${_base}"
license=(BSD-3-Clause)
depends=(fftw python-numpy openmp)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest python-scipy python-dask)
optdepends=('python-scipy: scipy.fftpack support'
  'python-dask: dask.fft support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('e73f30803272f7fda0952a2e6368358ed15b985ae2e9fe2d63937790b56b5607')

build() {
  cd ${_base}-${pkgver}
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
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
