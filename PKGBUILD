# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=scikit-hep-testdata
pkgname="python-${_pkgname}"
pkgver=0.5.4
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
b2sums=('76bcda1990994d2e87b64037771364e59491c1280a574eb0155af33ae76cc18df536d1a592752f5d3b348bf42c6d06fa84f25bb4de2bbc4121f0124d337b0834')

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
