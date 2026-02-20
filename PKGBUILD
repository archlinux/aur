# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=scikit-hep-testdata
pkgname="python-${_pkgname}"
pkgver=0.6.1
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
b2sums=('dd8ed76c7c8f6d189a6a0374cbf0573df8f55a8f10334689ceaacaa2f4c1d37404e1bf04a9fc91e147d855456fa95f481541e2ae0a13b4fdafca8523e0f9b91d')

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
