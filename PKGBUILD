# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meds
pkgname=python-${_base}
pkgver=0.9.17
pkgrel=1
pkgdesc="Python and C libraries for reading MEDS files"
arch=(x86_64)
url="https://github.com/esheldon/${_base}"
license=(GPL3)
depends=(python-fitsio python-esutil python-joblib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('dab091074c42a8859d8e176945820145c1fb0fe53f6d70a49b28c7fac0126bd4b03ba8fcc91bd29e05f446099f5d453a03a470070af57b8fff29ff6a94f06183')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
