# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Moritz Kaspar Rudert (mortzu) <me@mortzu.de>
# Maintainer: Andy Botting <andy@andybotting.com>
_base=wikitextparser
pkgname=python-${_base}
pkgver=0.54.1
pkgrel=1
pkgdesc="A simple parsing tool for MediaWiki's wikitext markup"
arch=(any)
url="https://github.com/5j9/${_base}"
license=(GPL3)
depends=(python-regex python-wcwidth)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d3671c2db00cce454c033313869cd38b31b16ae8c6f39d1281fc057aa285b0ca8692beace89fae8e2937f068d020795aee2f4ee3b179868d3ef03c83925e379d')

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
