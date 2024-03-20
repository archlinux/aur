# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Moritz Kaspar Rudert (mortzu) <me@mortzu.de>
# Maintainer: Andy Botting <andy@andybotting.com>
_base=wikitextparser
pkgname=python-${_base}
pkgver=0.55.10
pkgrel=1
pkgdesc="A simple parsing tool for MediaWiki's wikitext markup"
arch=(any)
url="https://github.com/5j9/${_base}"
license=(GPL-3.0-or-later)
depends=(python-regex python-wcwidth)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('acdfd506156ad092071ea845c53dd351a4db4c50158845d3c25480afc9f4a03a27488ef34656d45236cda0964c16abf13f617fd6d865c143c1053a7d908c387b')

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
