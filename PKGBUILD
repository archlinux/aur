# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
_base=elasticsearch-dsl
pkgname=python-${_base}
pkgver=8.16.0
pkgrel=1
pkgdesc="Python client for Elasticsearch"
arch=(any)
url="https://github.com/elastic/${_base}-py"
license=(Apache-2.0)
depends=(python-elasticsearch python-dateutil python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel) # python-sphinx_rtd_theme
# checkdepends=(python-pytest-mock python-mock python-pytest-asyncio python-nltk
#   python-sentence-transformers)
source=(${_base}-py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('db1d6c8d0756b63dabc55fbf716fa5656e07206f22df86e6278a4271c001f74e5970d5b78873911b8194df3809b24fab47a8ed0595d518e4c7673204e7812c3e')

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
