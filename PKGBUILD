# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Moritz Kaspar Rudert (mortzu) <me@mortzu.de>
# Maintainer: Andy Botting <andy@andybotting.com>
_base=wikitextparser
pkgname=python-${_base}
pkgver=0.55.9
pkgrel=1
pkgdesc="A simple parsing tool for MediaWiki's wikitext markup"
arch=(any)
url="https://github.com/5j9/${_base}"
license=(GPL-3.0-or-later)
depends=(python-regex python-wcwidth)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('873072a284ff0840427e110536a3205821b4b480f373b0089194fde5d287b98e4823d4647e94bb1274c01fca17eb5ba76ec74febd0b107f4b9004ae4cc6d4ba9')

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
