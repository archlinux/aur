# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
_base=elasticsearch-dsl
pkgname=python-${_base}
pkgver=7.4.0
pkgrel=2
pkgdesc="Python client for Elasticsearch"
arch=(any)
url="https://github.com/elastic/${_base}-py"
license=(Apache2)
depends=(python-elasticsearch python-dateparser)
makedepends=(python-setuptools python-sphinx_rtd_theme)
checkdepends=(python-pytest python-mock)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('80f292ea79f2dd6d32e6036b7913d92fe03892b5cea4bb0d998f0a3e2f15cb16e2c1975ee0d4e52e64cbf42d337dc9de1bd46b046b40efa855ec2321ebcd26f2')

build() {
  cd ${_base}-py-${pkgver}
  python setup.py build
  cd docs
  PYTHONPATH="${srcdir}/${_base}-py-${pkgver}/build/lib/:${PYTHONPATH}" make man
}

check() {
  cd ${_base}-py-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-py-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 docs/_build/man/${_base}.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a examples "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
