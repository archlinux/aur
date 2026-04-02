# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Łukasz Pożarlik <lpozarlik@gmail.com>
_base=youtube
pkgname=python-sphinxcontrib-${_base}
pkgdesc="Sphinx extension to embed videos from YouTube"
pkgver=1.5.0
pkgrel=1
arch=(any)
url="https://github.com/sphinx-contrib/${_base}"
license=(BSD-3-Clause)
depends=(python-sphinx python-requests)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest-regressions python-beautifulsoup4)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d7aa53429261e2e8d76a1f1d22badb11431f5c568b9d224a729a155eb84498e20f77dda91d34438dc1563286495e20afd7680da8f0822091b031d0d076a15380')

build(){
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
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
