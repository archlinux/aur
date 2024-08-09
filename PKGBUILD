# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Łukasz Pożarlik <lpozarlik@gmail.com>
_base=youtube
pkgname=python-sphinxcontrib-${_base}
pkgdesc="Sphinx extension to embed videos from YouTube"
pkgver=1.4.1
pkgrel=2
arch=(any)
url="https://github.com/sphinx-contrib/${_base}"
license=(BSD-3-Clause)
depends=(python-sphinx python-requests)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest-regressions python-beautifulsoup4)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('df449e23ca3df02d8a3d9ee4355155e9b0b93069b5c980c99683aff3f0e9104d10d38faf2e1a5181cceed28613c495423f33c477fe24cc00389fa1f7ea443f9a')

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
