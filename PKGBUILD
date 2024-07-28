# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=birdseye
pkgname=python-${_base}
pkgdesc="Graphical Python debugger which lets you view the values of all evaluated expressions"
pkgver=0.9.5
pkgrel=1
arch=(any)
url="https://github.com/alexmojaki/${_base}"
license=(MIT)
depends=(python-flask-humanize python-sqlalchemy python-asttokens python-littleutils
  python-cheap_repr python-outdated python-cached-property)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-markupsafe python-pandas python-beautifulsoup4
  python-selenium python-flask) # chromedriver
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fdd95e85302f75162edd1e8fb1f1530674da0fdd9b5f29a6b4d0d0c46a91ce12932b92e6d35b256d90cd8260c76dd3f692e8d53e303fd4dac835da35615bf2ae')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest -k 'not against_files and not cheap_repr and not interface.py and not open_with_encoding_check'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t ${pkgdir}/usr/share/doc/${pkgname}
}
