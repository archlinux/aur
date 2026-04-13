# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis

_base=Coord
pkgname=python-${_base,,}
pkgver=1.3.1
pkgrel=1
pkgdesc="A Python module for handling angles and celestial coordinates."
arch=('any')
url="https://github.com/LSSTDESC/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx)
checkdepends=(python-pytest python-astropy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6ae454ca0920b5c518caf2a02b6fc5265c90cd4fadfb0c9693734a7e1a7e758cea042f3ae1bbdae8a14861ad7589463b13c812fceb376035c71fb80c449062f2')

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
  install -D -m644 LICENSE \
  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
