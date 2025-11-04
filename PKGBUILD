# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=pydna
pkgname=python-${_base}
pkgver=5.5.4
pkgrel=1
pkgdesc="Representing double stranded DNA and functions for simulating cloning and homologous recombination between DNA molecules"
arch=(any)
url="https://github.com/bjornfjohansson/${_base}"
license=(BSD-3-Clause)
depends=(python-appdirs python-biopython python-networkx python-prettytable
	python-pyfiglet python-regex)
makedepends=(python-build python-installer python-poetry-dynamic-versioning python-wheel git)
checkdepends=(python-pytest python-requests-mock ipython) # python-cai2
optdepends=('python-scipy: gel simulation'
  'python-matplotlib: gel simulation'
  'python-pyparsing: download'
  'python-requests: download'
  'python-cai2: express')
source=("git+${url}.git?#tag=v${pkgver}")
sha512sums=('e1a8bb393a93b44a9188212dc4f0990733ade2ed37e4b8b3430d80edd99fd6425bb59eb7a6b300ddca4927cca58367e4ca6e784e45c1ee4204f4c9d87c67eecd')

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
