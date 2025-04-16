# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis
_base=Coord
pkgname=python-${_base,,}
pkgver=1.3.0
pkgrel=2
pkgdesc="A Python module for handling angles and celestial coordinates."
arch=('x86_64')
url="https://github.com/LSSTDESC/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx)
checkdepends=(python-pytest python-astropy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f728779de9a2de6e2bf75c0c0147b8754cc8c9271f919f4c9bb37ce158f21c587f0f42ca8ee2ea1b32ef108e5f9bb5f31750142c5c50f379d9604391a3e92e08')

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
