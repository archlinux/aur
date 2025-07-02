# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyfonts
pkgname=python-${_base}
pkgdesc="A simple and reproducible way of using fonts in matplotlib"
pkgver=1.0.0
pkgrel=1
arch=(x86_64)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(MIT)
depends=(python-matplotlib python-requests)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1f5911542adb1653edb5c03dd3c835f892ce4333b733901ccc178278a462846e1b5f84009ded5f83001e2b29ad9a51e9de17d7dbf114da31260866ca210a0fc2')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
