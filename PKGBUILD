# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=birdseye
pkgname=python-${_base}
pkgdesc="Graphical Python debugger which lets you view the values of all evaluated expressions"
pkgver=0.10.0
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
sha512sums=('f1641ce59796e67311af13435ec30a50f05852b7a92a120dcab235f736edf1561e352f608bc6355b73c3f81ec4bae5d5d680070a5323d81773a085ac4d17ea12')

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
