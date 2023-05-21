# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=pingparsing
pkgname=python-${_base}
pkgver=1.4.1
pkgrel=1
pkgdesc="CLI and library parser and transmitter for ping"
arch=(any)
url="https://github.com/thombashi/${_base}"
license=(MIT)
depends=(python-humanreadable python-pyparsing python-subprocrunner)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytz)
provides=("${_base}")
replaces=("${_base}")
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz
  https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz.asc)
sha512sums=('98236ad5c5206a78b1b92f14c41c9bfeb85405dc6bbdfa7e935ca8e6da669d2aa1bf7a229edffbf5cdfd64abd76ad8b7deb2363febd296e0ddf39bb40acb139f'
  'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

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
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
