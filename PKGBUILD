# Maintainer: fordprefect <fordprefect@dukun.de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Author: Antony Lee <anntzer.lee@gmail.com>
# Contributor: Georg Schlisio <g.schlisio@dukun.de>
_base=pyFFTW
pkgname=python-${_base,,}
pkgver=0.15.1
pkgrel=2
pkgdesc="A pythonic wrapper around FFTW"
arch=(x86_64 aarch64)
url="https://github.com/${_base}/${_base}"
license=(BSD-3-Clause)
depends=(fftw python-numpy openmp)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython)
checkdepends=(python-pytest python-scipy python-dask)
optdepends=('python-scipy: scipy.fftpack support'
  'python-dask: dask.fft support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('62116dee9541b6651330db1b29d05144f7456b7b9785bb42f16083427f680bf1')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
