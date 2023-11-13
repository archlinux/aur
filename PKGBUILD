# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
_base=elasticsearch-dsl
pkgname=python-${_base}
pkgver=8.11.0
pkgrel=1
pkgdesc="Python client for Elasticsearch"
arch=(any)
url="https://github.com/elastic/${_base}-py"
license=(Apache2)
depends=(python-elasticsearch python-dateparser)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx_rtd_theme)
# checkdepends=(python-pytest-mock python-mock)
source=(${_base}-py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('19e6444b365b6e0922a494881708c6a32211111bd75919659f7677b341acef43d1a6edceb163e44559111709e4f86bd91d320065859a0e269532d4e08abf189c')

build() {
  cd ${_base}-py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  # cd docs
  # PYTHONPATH="${srcdir}/${_base}-py-${pkgver}/build/lib/:${PYTHONPATH}" make man
}

# check() {
#   cd ${_base}-py-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  # install -Dm 644 docs/_build/man/${_base}.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a examples "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
