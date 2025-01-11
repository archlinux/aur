# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=scikit-hep-testdata
pkgname="python-${_pkgname}"
pkgver=0.5.2
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
b2sums=('4557238079bc0043ae5e9c4adf1bd314d21885b2446844d1c73302535da0b942a577854e4157787c4fa466892d1452d44754f0655dd44a59bad2efa2698e210c')

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
