# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis
_base=Coord
pkgname=python-${_base,,}
pkgver=1.2.3
pkgrel=1
pkgdesc="Python module for handling angle and celestial coordinates"
arch=('x86_64')
url="https://github.com/LSSTDESC/${_base}"
license=(MIT)
depends=(libffi python-cffi python-future python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx)
checkdepends=(python-pytest python-astropy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6e1168254864529edfb8090b38926c482a50b19bcc2a6268e6a92d8dd4881bcd6999dc0f2b8a067fd0ce8b8217673844ac23cfa8feec3652ceeb8235dac19ee9')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  PYTHONPATH="$PWD" make -C docs man
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
  install -Dm644 docs/_build/man/${_base,,}.1 -t "$pkgdir/usr/share/man/man1/"
}
