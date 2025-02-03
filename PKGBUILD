# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gabriel "ArcturusB" Perouze" <arcturus@openmailbox.org>
_base=sep
pkgname=python-${_base}
pkgver=1.4.0
pkgrel=1
pkgdesc="Astronomical source extraction and photometry library"
arch=(x86_64)
url="https://github.com/kbarbary/${_base}"
license=(MIT LGPL3)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython) # swig
checkdepends=(python-pytest python-astropy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a657c0e7e7b417d427db23bc7d97d6732e8bf40baa75558744d0414355ed3224eaca652a75af0704496b0b17383be64ac8f1bfd19860269efc28cf623d7672bc')

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
