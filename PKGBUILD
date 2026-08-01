# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Moritz Kaspar Rudert (mortzu) <me@mortzu.de>
# Maintainer: Andy Botting <andy@andybotting.com>
_base=wikitextparser
pkgname=python-${_base}
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple parsing tool for MediaWiki's wikitext markup"
arch=(any)
url="https://github.com/5j9/${_base}"
license=(GPL-3.0-or-later)
depends=(python-regex python-wcwidth)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('64e9da79235003193c74ab5e3136747148bf88a29e6a92a17b81830699c1550d29f4536f109f423e20ae58d2c9699154f2a5c85aafdef61e6d897d77e2420700')

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
