# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=scikit-hep-testdata
pkgname="python-${_pkgname}"
pkgver=0.5.9
pkgrel=1
pkgdesc='A common package to provide example files (e.g. ROOT) for testing and developing packages against'
arch=(any)
license=(BSD-3-Clause)
url="https://github.com/scikit-hep/${_pkgname}"
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools-scm
  python-toml
)
checkdepends=(
  python-pytest
)
depends=(
  python
  python-yaml
  python-requests
)
source=("$_pkgname::git+$url#tag=v$pkgver")
b2sums=('febb1495f91fbd44488cfdd710c346e30ea6ce042e7090d26be817a4201473820672857fc2fe38e8ad99bbb6dcae18518ab1468f53bdfaf0cb6da2aaf889b08b')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
