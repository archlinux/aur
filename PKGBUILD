# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=pydna
pkgname=python-${_base}
pkgver=5.2.0
pkgrel=1
pkgdesc="Representing double stranded DNA and functions for simulating cloning and homologous recombination between DNA molecules"
arch=(any)
url="https://github.com/bjornfjohansson/${_base}"
license=('custom:BSD-3-clause')
depends=(python-appdirs python-biopython python-networkx python-prettytable python-pyperclip python-pyfiglet)
makedepends=(python-build python-installer python-poetry-dynamic-versioning python-wheel git)
checkdepends=(python-pytest python-requests-mock ipython) # python-cai2
optdepends=('python-scipy: gel simulation'
  'python-matplotlib: gel simulation'
  'python-pyparsing: download'
  'python-requests: download'
  'python-cai2: express')
source=("git+${url}.git?#tag=v${pkgver}")
sha512sums=('SKIP')

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
