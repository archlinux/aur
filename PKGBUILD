# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=scikit-hep-testdata
pkgname="python-${_pkgname}"
pkgver=0.5.8
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
b2sums=('bd2480aa5c3e7526de72fd527baf826f5d22f85e12f0d3b956ef2372b48b87f2b3e3c50147c848f8323e583470e1813511acb9fe2b971011dad7860229551c20')

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
