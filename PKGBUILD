# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
_base=elasticsearch-dsl
pkgname=python-${_base}
pkgver=8.12.0
pkgrel=1
pkgdesc="Python client for Elasticsearch"
arch=(any)
url="https://github.com/elastic/${_base}-py"
license=(Apache)
depends=(python-elasticsearch python-dateparser)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx_rtd_theme)
# checkdepends=(python-pytest-mock python-mock)
source=(${_base}-py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5e3b51a1ea21521e7b7005dc95945479b3634dc77af293775d6c1bc82b52589057f8be9749b696795bda7c0ac57739240a1699acc773f4bddd64de3cec4704c2')

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
