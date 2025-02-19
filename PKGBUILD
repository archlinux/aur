# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gabriel "ArcturusB" Perouze" <arcturus@openmailbox.org>
_base=sep
pkgname=python-${_base}
pkgver=1.4.1
pkgrel=1
pkgdesc="Astronomical source extraction and photometry library"
arch=(x86_64)
url="https://github.com/kbarbary/${_base}"
license=(MIT LGPL3)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython) # swig
checkdepends=(python-pytest python-astropy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c7fbda25bb25bbaff53244f80a9deb457025930928e59145cdf6e0ae1e17f2bcdb0820ccb98aac75249a61db0a1a47c04bb2bab359976580714dfcefb44884b9')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest test.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
