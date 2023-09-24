# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=sphinx-external-toc
pkgname=python-${_base}
pkgdesc="A sphinx extension that allows the site-map to be defined in a single YAML file"
pkgver=0.3.1
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${_base}"
license=(MIT)
depends=(python-click python-yaml python-sphinx)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest-regressions)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('055b399a983726e22e4d4483f9037039f73748b5586ab4e90f8bd458f01b2b05aedf1b223fd0ddd783dc52350813cf3232c8d88a32f94a210a7431d803675190')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=tests/test_sphinx.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
