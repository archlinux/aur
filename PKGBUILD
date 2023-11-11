# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=sphinx-external-toc
pkgname=python-${_base}
pkgdesc="A sphinx extension that allows the site-map to be defined in a single YAML file"
pkgver=1.0.0
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${_base}"
license=(MIT)
depends=(python-click python-yaml python-sphinx)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest-regressions)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4ec47beccb043ea87ef08e47f00df41c2536aca370cf97237b810fe7309ee2cd89a195584de6dead7acc12076fc2b5b64a7b1d9201e5cc21244c5f84009856a4')

build() {
  cd ${_base}-${pkgver}
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
