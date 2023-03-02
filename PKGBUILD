# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
_base=elasticsearch-dsl
pkgname=python-${_base}
pkgver=7.4.1
pkgrel=1
pkgdesc="Python client for Elasticsearch"
arch=(any)
url="https://github.com/elastic/${_base}-py"
license=(Apache2)
depends=(python-elasticsearch python-dateparser)
makedepends=(python-setuptools python-sphinx_rtd_theme)
checkdepends=(python-pytest-mock python-mock)
source=(${_base}-py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9493f7b66399e6c09ead90775435995e4827cb1fa34b68ead250444690bce17095002a2494c481344e03159111c3060051391e2798455769f98f56202bd67a5c')

build() {
  cd ${_base}-py-${pkgver}
  python setup.py build
  cd docs
  PYTHONPATH="${srcdir}/${_base}-py-${pkgver}/build/lib/:${PYTHONPATH}" make man
}

check() {
  PYTHONPATH="${srcdir}/${_base}-py-${pkgver}/build/lib/:${PYTHONPATH}" python -m pytest ${_base}-py-${pkgver}/tests
}

package() {
  cd ${_base}-py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 docs/_build/man/${_base}.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a examples "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
