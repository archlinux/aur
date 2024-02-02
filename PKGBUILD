# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-variables
pkgname=python-${_base}
pkgdesc="pytest plugin for providing variables to tests/fixtures"
pkgver=3.1.0
pkgrel=1
arch=(any)
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest)
makedepends=(python-build python-installer python-hatch-vcs)
checkdepends=(python-hjson python-yaml python-toml)
optdepends=('python-hjson: for json support'
  'python-yaml: for YAML support'
  'python-toml: for TOML support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('000bda9ce75fd2fa176d97e62512e5dcb6e03f8234faf5753fc31374c60625b4773aa52f42501ba43d43a99d7c3d956b7b5d62398c8c19b18c2d38399594adc8')

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
