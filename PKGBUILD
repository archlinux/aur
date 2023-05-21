# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=daft
pkgname=python-${_base}
pkgver=0.1.2
pkgrel=3
pkgdesc="Render probabilistic graphical models using matplotlib"
arch=(any)
url="https://github.com/daft-dev/${_base}"
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools-scm python-wheel python-myst-nb)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a00c1f44e8b3c0366348a4c3c3ecf40850e59d79c1e1d76154c63a27abe21e5e6dbd388a503bf96be57508ec8144d710d27fb9e00ab01825615a9b1ec1359551')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  PYTHONPATH="${PWD}" make -C docs man
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=test/test_examples.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
