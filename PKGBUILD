# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Moritz Kaspar Rudert (mortzu) <me@mortzu.de>
# Maintainer: Andy Botting <andy@andybotting.com>
_base=wikitextparser
pkgname=python-${_base}
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple parsing tool for MediaWiki's wikitext markup"
arch=(any)
url="https://github.com/5j9/${_base}"
license=(GPL-3.0-or-later)
depends=(python-regex python-wcwidth)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c4393cd2ef91eb03a42e1f68d20a862ba476dc36c47c57570eef9b68df4779a7095e95aa12bdc4721a9529b5d3e0e053ad373880c006503fae9a39d520cf630d')

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
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
